#' @importFrom sessioninfo os_name
#' @importFrom stringi stri_encode
encode_in_win7 <- function(x) {
    if (sessioninfo::os_name() %>% str_detect("mac")) {
        x
    } else {
        stringi::stri_encode(str = x,
                             from = "UTF-8",
                             to = "GBK") %>%
            str_flatten("")
    }
}

#' Extract the log content from GitLab API.
#'
#' @importFrom glue glue
#' @importFrom jsonlite fromJSON
#' @export
get_log <- function(request,
                    .token,
                    .method = "",
                    is_df = TRUE) {
    # pre- and post-fix

    # learn from
    # https://stackoverflow.com/questions/31805041/how-to-access-gitlab-issues-using-curl
    prefix <-
        glue::glue('curl {.method} --header "PRIVATE-TOKEN: {.token}"')
    postfix <- '-s'

    result <-
        glue::glue('{prefix} {request} {postfix}') %>%
        system(intern = TRUE) %>%
        encode_in_win7()
    if (!is_df) {
        return(result)
    } else {
        result %>%
            jsonlite::fromJSON()

    }
}

#' List all projects user own.
#'
#' @export
get_own_project <- function(.token, .api_url) {
    request <- glue::glue('{.api_url}/api/v4/projects?owned=true&order_by=last_activity_at')
    get_log(request, .token, is_df = TRUE)
}

#' Extract the issue title, body and comments from a GitLab issue in markdown.
#'
#' @importFrom readr read_file
#' @importFrom glue glue
#' @importFrom stringr str_flatten
#' @importFrom usethis ui_info
#' @importFrom clipr write_clip
#' @param url GitLab issue URL.
#' @import dplyr
#' @import stringr
#' @importFrom zeallot "%<-%"
#' @param .token GitLab access token path you save.
#' @param project_number The project Number. If the \code{url} is \code{NULL}.
#' @param issue_number The issue Number. If the \code{url} is \code{NULL}.
#' @param .api_url The IP address, if the GitLab is internal.
#' @export
get_issue_content <-
    function(url = NULL,
             project_number,
             issue_number,
             .token,
             .api_url) {
        # URL

        url_component <- url %>%
            stringr::str_remove(.api_url) %>%
            stringr::str_replace_all("/", " ") %>%
            stringr::str_trim() %>%
            stringr::str_split(" ") %>%
            .[[1]]

        c(username, projectname, drop_txt, issue_number) %<-% url_component

        # get project number

        project_number <-
            get_own_project(.token, .api_url) %>%
            dplyr::filter(name == projectname) %>%
            .$id

        # request expression

        issue_request <-
            glue::glue('{.api_url}/api/v4/projects/{project_number}/issues/{issue_number}')

        comment_request <- glue::glue('{issue_request}/notes')

        # pre- and post-fix

        prefix <-
            glue::glue('curl --header "PRIVATE-TOKEN: {.token}"')
        postfix <- '-s'

        # get json

        issue_json <-
            get_log(issue_request,
                    .token = .token)

        comment_json <-
            get_log(comment_request,
                    .token = .token) %>%
            dplyr::arrange(id) %>%
            dplyr::select(body)

        result <- c(issue_json$title,
                    issue_json$description,
                    comment_json$body) %>%
            stringr::str_flatten("\n\n")

        if (!is.null(username) & !is.null(projectname)) {
            result =
                result %>%
                stringr::str_replace_all("/uploads/",
                                         glue::glue("{.api_url}/{username}/{projectname}/uploads/"))
        }

        usethis::ui_info("The content is on your clipboard.")
        clipr::write_clip(result)
        invisible(result)
    }

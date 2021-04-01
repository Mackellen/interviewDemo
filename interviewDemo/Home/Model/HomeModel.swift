//
//  HomeModel.swift
//  interviewDemo
//
//  Created by Mackellen on 2020/9/24.
//  Copyright © 2020 mackellen. All rights reserved.
//

import UIKit
import RealmSwift
import RxRealm


class HomeModel: Object {

    @objc dynamic var current_user_url: String?
    @objc dynamic var current_user_authorizations_html_url: String?
    @objc dynamic var authorizations_url: String?
    @objc dynamic var code_search_url: String?
    @objc dynamic var commit_search_url: String?
    @objc dynamic var emails_url: String?
    @objc dynamic var emojis_url: String?
    @objc dynamic var events_url: String?
    @objc dynamic var feeds_url: String?
    @objc dynamic var followers_url: String?
    @objc dynamic var following_url: String?
    @objc dynamic var gists_url: String?
    @objc dynamic var hub_url: String?
    @objc dynamic var issue_search_url: String?
    @objc dynamic var issues_url: String?
    @objc dynamic var keys_url: String?
    @objc dynamic var label_search_url: String?
    @objc dynamic var notifications_url: String?
    @objc dynamic var organization_url: String?
    @objc dynamic var organization_repositories_url: String?
    @objc dynamic var organization_teams_url: String?
    @objc dynamic var public_gists_url: String?
    @objc dynamic var rate_limit_url: String?
    @objc dynamic var repository_url: String?
    @objc dynamic var repository_search_url: String?
    @objc dynamic var current_user_repositories_url: String?
    @objc dynamic var starred_url: String?
    @objc dynamic var starred_gists_url: String?
    @objc dynamic var user_url: String?
    @objc dynamic var user_organizations_url: String?
    @objc dynamic var user_repositories_url: String?
    @objc dynamic var user_search_url: String?
    
    func toDictionary() -> [String: String?] {
        return ["current_user_url": self.current_user_url,
                "current_user_authorizations_html_url": current_user_authorizations_html_url,
                "authorizations_url":authorizations_url,
                "code_search_url": code_search_url,
                "commit_search_url": commit_search_url,
                "emails_url": emails_url,
                "emojis_url": emojis_url,
                "events_url": events_url,
                "feeds_url": feeds_url,
                "followers_url": followers_url,
                "following_url": following_url,
                "gists_url": gists_url,
                "hub_url": hub_url,
                "issue_search_url": issue_search_url,
                "issues_url": issues_url,
                "keys_url": keys_url,
                "label_search_url": label_search_url,
                "notifications_url": notifications_url,
                "organization_url": organization_url,
                "organization_repositories_url": organization_repositories_url,
                "organization_teams_url": organization_teams_url,
                "public_gists_url": public_gists_url,
                "rate_limit_url": rate_limit_url,
                "repository_url": repository_url,
                "repository_search_url": repository_search_url,
                "current_user_repositories_url": current_user_repositories_url,
                "starred_url": starred_url,
                "starred_gists_url": starred_gists_url,
                "user_url": user_url,
                "user_organizations_url": user_organizations_url,
                "user_repositories_url": user_repositories_url,
                "user_search_url": user_search_url
        ]
    }

}

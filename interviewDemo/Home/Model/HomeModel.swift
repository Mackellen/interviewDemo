//
//  HomeModel.swift
//  interviewDemo
//
//  Created by wang fei on 2020/9/24.
//  Copyright © 2020 mackellen. All rights reserved.
//

import UIKit

fileprivate struct Metric {
    static let currentUserUrl : String = "HomeModel_currentUserUrl"
    static let currentUserAuthorizationsHtmlUrl : String = "HomeModel_currentUserAuthorizationsHtmlUrl"
    static let authorizationsUrl: String = "HomeModel_authorizationsUrl"
    static let codeSearchUrl : String = "HomeModel_codeSearchUrl"
    static let commitSearchUrl : String = "HomeModel_commitSearchUrl"
    static let emailsUrl: String = "HomeModel_emailsUrl"
    static let emojisUrl : String = "HomeModel_emojisUrl"
    static let eventsUrl : String = "HomeModel_eventsUrl"
    static let feedsUrl: String = "HomeModel_feedsUrl"
    static let followersUrl : String = "HomeModel_followersUrl"
    static let followingUrl : String = "HomeModel_followingUrl"
    static let gistsUrl: String = "HomeModel_gistsUrl"
    static let hubUrl : String = "HomeModel_hubUrl"
    static let issueSearchUrl : String = "HomeModel_issueSearchUrl"
    static let issuesUrl: String = "HomeModel_issuesUrl"
    static let keysUrl : String = "HomeModel_keysUrl"
    static let labelSearchUrl : String = "HomeModel_labelSearchUrl"
    static let notificationsUrl: String = "HomeModel_notificationsUrl"
    static let organizationUrl: String = "HomeModel_organizationUrl"
    static let organizationRepositoriesUrl: String = "HomeModel_organizationRepositoriesUrl"
    static let organizationTeamsUrl: String = "HomeModel_organizationTeamsUrl"
    static let publicGistsUrl: String = "HomeModel_publicGistsUrl"
    static let rateLimitUrl: String = "HomeModel_rateLimitUrl"
    static let repositoryUrl: String = "HomeModel_repositoryUrl"
    static let repositorySearchUrl: String = "HomeModel_repositorySearchUrl"
    static let currentUserRepositoriesUrl: String = "HomeModel_currentUserRepositoriesUrl"
    static let starredUrl: String = "HomeModel_starredUrl"
    static let starredGistsUrl: String = "HomeModel_starredGistsUrl"
    static let userUrl: String = "HomeModel_userUrl"
    static let userOrganizationsUrl: String = "HomeModel_userOrganizationsUrl"
    static let userRepositoriesUrl: String = "HomeModel_userRepositoriesUrl"
    static let userSearchUrl: String = "HomeModel_userSearchUrl"
    
}

class HomeModel: NSObject, NSCoding {
    
    var currentUserUrl: String?
    var currentUserAuthorizationsHtmlUrl: String?
    var authorizationsUrl: String?
    var codeSearchUrl: String?
    var commitSearchUrl: String?
    var emailsUrl: String?
    var emojisUrl: String?
    var eventsUrl: String?
    var feedsUrl: String?
    var followersUrl: String?
    var followingUrl: String?
    var gistsUrl: String?
    var hubUrl: String?
    var issueSearchUrl: String?
    var issuesUrl: String?
    var keysUrl: String?
    var labelSearchUrl: String?
    var notificationsUrl: String?
    var organizationUrl: String?
    var organizationRepositoriesUrl: String?
    var organizationTeamsUrl: String?
    var publicGistsUrl: String?
    var rateLimitUrl: String?
    var repositoryUrl: String?
    var repositorySearchUrl: String?
    var currentUserRepositoriesUrl: String?
    var starredUrl: String?
    var starredGistsUrl: String?
    var userUrl: String?
    var userOrganizationsUrl: String?
    var userRepositoriesUrl: String?
    var userSearchUrl: String?
    
    
    required init?(coder: NSCoder) {
        currentUserUrl = coder.decodeObject(forKey: Metric.currentUserUrl) as? String
        currentUserAuthorizationsHtmlUrl = coder.decodeObject(forKey: Metric.currentUserAuthorizationsHtmlUrl) as? String
        authorizationsUrl = coder.decodeObject(forKey: Metric.authorizationsUrl) as? String
        codeSearchUrl = coder.decodeObject(forKey: Metric.codeSearchUrl) as? String
        commitSearchUrl = coder.decodeObject(forKey: Metric.commitSearchUrl) as? String
        emailsUrl = coder.decodeObject(forKey: Metric.emailsUrl) as? String
        emojisUrl = coder.decodeObject(forKey: Metric.emojisUrl) as? String
        eventsUrl = coder.decodeObject(forKey: Metric.eventsUrl) as? String
        feedsUrl = coder.decodeObject(forKey: Metric.feedsUrl) as? String
        followersUrl = coder.decodeObject(forKey: Metric.followersUrl) as? String
        followingUrl = coder.decodeObject(forKey: Metric.followingUrl) as? String
        gistsUrl = coder.decodeObject(forKey: Metric.gistsUrl) as? String
        hubUrl = coder.decodeObject(forKey: Metric.hubUrl) as? String
        issueSearchUrl = coder.decodeObject(forKey: Metric.issueSearchUrl) as? String
        issuesUrl = coder.decodeObject(forKey: Metric.issuesUrl) as? String
        keysUrl = coder.decodeObject(forKey: Metric.keysUrl) as? String
        labelSearchUrl = coder.decodeObject(forKey: Metric.labelSearchUrl) as? String
        notificationsUrl = coder.decodeObject(forKey: Metric.notificationsUrl) as? String
        organizationUrl = coder.decodeObject(forKey: Metric.organizationUrl) as? String
        organizationRepositoriesUrl = coder.decodeObject(forKey: Metric.organizationRepositoriesUrl) as? String
        organizationTeamsUrl = coder.decodeObject(forKey: Metric.organizationTeamsUrl) as? String
        publicGistsUrl = coder.decodeObject(forKey: Metric.publicGistsUrl) as? String
        rateLimitUrl = coder.decodeObject(forKey: Metric.rateLimitUrl) as? String
        repositoryUrl = coder.decodeObject(forKey: Metric.repositoryUrl) as? String
        repositorySearchUrl = coder.decodeObject(forKey: Metric.repositorySearchUrl) as? String
        currentUserRepositoriesUrl = coder.decodeObject(forKey: Metric.currentUserRepositoriesUrl) as? String
        starredUrl = coder.decodeObject(forKey: Metric.starredUrl) as? String
        starredGistsUrl = coder.decodeObject(forKey: Metric.starredGistsUrl) as? String
        userUrl = coder.decodeObject(forKey: Metric.userUrl) as? String
        userOrganizationsUrl = coder.decodeObject(forKey: Metric.userOrganizationsUrl) as? String
        userRepositoriesUrl = coder.decodeObject(forKey: Metric.userRepositoriesUrl) as? String
        userSearchUrl = coder.decodeObject(forKey: Metric.userSearchUrl) as? String

    }
    
    func encode(with coder: NSCoder) {
        coder.encode(currentUserUrl, forKey: Metric.currentUserUrl)
        coder.encode(currentUserAuthorizationsHtmlUrl, forKey: Metric.currentUserAuthorizationsHtmlUrl)
        coder.encode(authorizationsUrl, forKey: Metric.authorizationsUrl)
        coder.encode(codeSearchUrl, forKey: Metric.codeSearchUrl)
        coder.encode(commitSearchUrl, forKey: Metric.commitSearchUrl)
        coder.encode(emailsUrl, forKey: Metric.emailsUrl)
        coder.encode(emojisUrl, forKey: Metric.emojisUrl)
        coder.encode(eventsUrl, forKey: Metric.eventsUrl)
        coder.encode(feedsUrl, forKey: Metric.feedsUrl)
        coder.encode(followersUrl, forKey: Metric.followersUrl)
        coder.encode(followingUrl, forKey: Metric.followingUrl)
        coder.encode(gistsUrl, forKey: Metric.gistsUrl)
        coder.encode(hubUrl, forKey: Metric.hubUrl)
        coder.encode(issueSearchUrl, forKey: Metric.issueSearchUrl)
        coder.encode(issuesUrl, forKey: Metric.issuesUrl)
        coder.encode(keysUrl, forKey: Metric.keysUrl)
        coder.encode(labelSearchUrl, forKey: Metric.labelSearchUrl)
        coder.encode(notificationsUrl, forKey: Metric.notificationsUrl)
        coder.encode(organizationUrl, forKey: Metric.organizationUrl)
        coder.encode(organizationRepositoriesUrl, forKey: Metric.organizationRepositoriesUrl)
        coder.encode(organizationTeamsUrl, forKey: Metric.organizationTeamsUrl)
        coder.encode(publicGistsUrl, forKey: Metric.publicGistsUrl)
        coder.encode(rateLimitUrl, forKey: Metric.rateLimitUrl)
        coder.encode(repositoryUrl, forKey: Metric.repositoryUrl)
        coder.encode(repositorySearchUrl, forKey: Metric.repositorySearchUrl)
        coder.encode(currentUserRepositoriesUrl, forKey: Metric.currentUserRepositoriesUrl)
        coder.encode(starredUrl, forKey: Metric.starredUrl)
        coder.encode(starredGistsUrl, forKey: Metric.starredGistsUrl)
        coder.encode(userUrl, forKey: Metric.userUrl)
        coder.encode(userOrganizationsUrl, forKey: Metric.userOrganizationsUrl)
        coder.encode(userRepositoriesUrl, forKey: Metric.userRepositoriesUrl)
        coder.encode(userSearchUrl, forKey: Metric.userSearchUrl)
    }
    
    
    required init?(map: Dictionary<String,Any>) {
        currentUserUrl = map["current_user_url"] as? String
        currentUserAuthorizationsHtmlUrl = map["current_user_authorizations_html_url"] as? String
        authorizationsUrl = map["authorizations_url"] as? String
        codeSearchUrl = map["code_search_url"] as? String
        commitSearchUrl = map["commit_search_url"] as? String
        emailsUrl = map["emails_url"] as? String
        emojisUrl = map["emojis_url"] as? String
        eventsUrl = map["events_url"] as? String
        feedsUrl = map["feeds_url"] as? String
        followersUrl = map["followers_url"] as? String
        followingUrl = map["following_url"] as? String
        gistsUrl = map["gists_url"] as? String
        hubUrl = map["hub_url"] as? String
        issueSearchUrl = map["issue_search_url"] as? String
        issuesUrl = map["issuesUrl"] as? String
        keysUrl = map["keys_url"] as? String
        labelSearchUrl = map["label_search_url"] as? String
        notificationsUrl = map["notifications_url"] as? String
        organizationUrl = map["organization_url"] as? String
        organizationRepositoriesUrl = map["organization_repositories_url"] as? String
        organizationTeamsUrl = map["organization_teams_url"] as? String
        publicGistsUrl = map["public_gists_url"] as? String
        rateLimitUrl = map["rate_limit_url"] as? String
        repositoryUrl = map["repository_url"] as? String
        repositorySearchUrl = map["repository_search_url"] as? String
        currentUserRepositoriesUrl = map["current_user_repositories_url"] as? String
        starredUrl = map["starred_url"] as? String
        starredGistsUrl = map["starred_gists_url"] as? String
        userUrl = map["user_url"] as? String
        userOrganizationsUrl = map["user_organizations_url"] as? String
        userRepositoriesUrl = map["user_repositories_url"] as? String
        userSearchUrl = map["user_search_url"] as? String
    }
    
    func getDictionary() ->[String:Any]{
        
        let mirror = Mirror(reflecting: self)
           let dict = Dictionary(uniqueKeysWithValues: mirror.children.lazy.map({ (label:String?, value:Any) -> (String, Any)? in
             guard let label = label else { return nil }
             return (label, value)
           }).compactMap { $0 })
           return dict
    }
    
}

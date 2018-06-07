//  This file was automatically generated and should not be edited.

import Apollo

public final class EventsQuery: GraphQLQuery {
  public static let operationString =
    "query Events($name: String!) {\n  Eventbrite(name: $name) {\n    __typename\n    ...EventDetails\n  }\n}"

  public static var requestString: String { return operationString.appending(EventDetails.fragmentString) }

  public var name: String

  public init(name: String) {
    self.name = name
  }

  public var variables: GraphQLMap? {
    return ["name": name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("Eventbrite", arguments: ["name": GraphQLVariable("name")], type: .list(.object(Eventbrite.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(eventbrite: [Eventbrite?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "Eventbrite": eventbrite.flatMap { (value: [Eventbrite?]) -> [Snapshot?] in value.map { (value: Eventbrite?) -> Snapshot? in value.flatMap { (value: Eventbrite) -> Snapshot in value.snapshot } } }])
    }

    public var eventbrite: [Eventbrite?]? {
      get {
        return (snapshot["Eventbrite"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [Eventbrite?] in value.map { (value: Snapshot?) -> Eventbrite? in value.flatMap { (value: Snapshot) -> Eventbrite in Eventbrite(snapshot: value) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { (value: [Eventbrite?]) -> [Snapshot?] in value.map { (value: Eventbrite?) -> Snapshot? in value.flatMap { (value: Eventbrite) -> Snapshot in value.snapshot } } }, forKey: "Eventbrite")
      }
    }

    public struct Eventbrite: GraphQLSelectionSet {
      public static let possibleTypes = ["Event"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .object(Name.selections)),
        GraphQLField("url", type: .scalar(String.self)),
        GraphQLField("description", type: .object(Description.selections)),
        GraphQLField("start", type: .object(Start.selections)),
        GraphQLField("end", type: .object(End.selections)),
        GraphQLField("logo", type: .object(Logo.selections)),
        GraphQLField("venue", type: .object(Venue.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(name: Name? = nil, url: String? = nil, description: Description? = nil, start: Start? = nil, end: End? = nil, logo: Logo? = nil, venue: Venue? = nil) {
        self.init(snapshot: ["__typename": "Event", "name": name.flatMap { (value: Name) -> Snapshot in value.snapshot }, "url": url, "description": description.flatMap { (value: Description) -> Snapshot in value.snapshot }, "start": start.flatMap { (value: Start) -> Snapshot in value.snapshot }, "end": end.flatMap { (value: End) -> Snapshot in value.snapshot }, "logo": logo.flatMap { (value: Logo) -> Snapshot in value.snapshot }, "venue": venue.flatMap { (value: Venue) -> Snapshot in value.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: Name? {
        get {
          return (snapshot["name"] as? Snapshot).flatMap { Name(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "name")
        }
      }

      public var url: String? {
        get {
          return snapshot["url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url")
        }
      }

      public var description: Description? {
        get {
          return (snapshot["description"] as? Snapshot).flatMap { Description(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "description")
        }
      }

      public var start: Start? {
        get {
          return (snapshot["start"] as? Snapshot).flatMap { Start(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "start")
        }
      }

      public var end: End? {
        get {
          return (snapshot["end"] as? Snapshot).flatMap { End(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "end")
        }
      }

      public var logo: Logo? {
        get {
          return (snapshot["logo"] as? Snapshot).flatMap { Logo(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "logo")
        }
      }

      public var venue: Venue? {
        get {
          return (snapshot["venue"] as? Snapshot).flatMap { Venue(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "venue")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var eventDetails: EventDetails {
          get {
            return EventDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Name: GraphQLSelectionSet {
        public static let possibleTypes = ["EventName"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("text", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(text: String? = nil) {
          self.init(snapshot: ["__typename": "EventName", "text": text])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var text: String? {
          get {
            return snapshot["text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "text")
          }
        }
      }

      public struct Description: GraphQLSelectionSet {
        public static let possibleTypes = ["EventDescription"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("text", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(text: String? = nil) {
          self.init(snapshot: ["__typename": "EventDescription", "text": text])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var text: String? {
          get {
            return snapshot["text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "text")
          }
        }
      }

      public struct Start: GraphQLSelectionSet {
        public static let possibleTypes = ["Time"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("timezone", type: .scalar(String.self)),
          GraphQLField("local", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(timezone: String? = nil, local: String? = nil) {
          self.init(snapshot: ["__typename": "Time", "timezone": timezone, "local": local])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var timezone: String? {
          get {
            return snapshot["timezone"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timezone")
          }
        }

        public var local: String? {
          get {
            return snapshot["local"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "local")
          }
        }
      }

      public struct End: GraphQLSelectionSet {
        public static let possibleTypes = ["Time"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("timezone", type: .scalar(String.self)),
          GraphQLField("local", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(timezone: String? = nil, local: String? = nil) {
          self.init(snapshot: ["__typename": "Time", "timezone": timezone, "local": local])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var timezone: String? {
          get {
            return snapshot["timezone"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "timezone")
          }
        }

        public var local: String? {
          get {
            return snapshot["local"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "local")
          }
        }
      }

      public struct Logo: GraphQLSelectionSet {
        public static let possibleTypes = ["ImageObject"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("original", type: .object(Original.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(url: String? = nil, original: Original? = nil) {
          self.init(snapshot: ["__typename": "ImageObject", "url": url, "original": original.flatMap { (value: Original) -> Snapshot in value.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var url: String? {
          get {
            return snapshot["url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "url")
          }
        }

        public var original: Original? {
          get {
            return (snapshot["original"] as? Snapshot).flatMap { Original(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "original")
          }
        }

        public struct Original: GraphQLSelectionSet {
          public static let possibleTypes = ["ImageUrl"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("url", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(url: String? = nil) {
            self.init(snapshot: ["__typename": "ImageUrl", "url": url])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }
        }
      }

      public struct Venue: GraphQLSelectionSet {
        public static let possibleTypes = ["Venue"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("latitude", type: .scalar(String.self)),
          GraphQLField("longitude", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(name: String? = nil, latitude: String? = nil, longitude: String? = nil) {
          self.init(snapshot: ["__typename": "Venue", "name": name, "latitude": latitude, "longitude": longitude])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var latitude: String? {
          get {
            return snapshot["latitude"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "latitude")
          }
        }

        public var longitude: String? {
          get {
            return snapshot["longitude"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "longitude")
          }
        }
      }
    }
  }
}

public final class IconsQuery: GraphQLQuery {
  public static let operationString =
    "query Icons($name: String!) {\n  SearchNounProj(name: $name) {\n    __typename\n    id\n    preview_url_42\n    preview_url_84\n  }\n}"

  public var name: String

  public init(name: String) {
    self.name = name
  }

  public var variables: GraphQLMap? {
    return ["name": name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("SearchNounProj", arguments: ["name": GraphQLVariable("name")], type: .list(.object(SearchNounProj.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(searchNounProj: [SearchNounProj?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "SearchNounProj": searchNounProj.flatMap { (value: [SearchNounProj?]) -> [Snapshot?] in value.map { (value: SearchNounProj?) -> Snapshot? in value.flatMap { (value: SearchNounProj) -> Snapshot in value.snapshot } } }])
    }

    public var searchNounProj: [SearchNounProj?]? {
      get {
        return (snapshot["SearchNounProj"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [SearchNounProj?] in value.map { (value: Snapshot?) -> SearchNounProj? in value.flatMap { (value: Snapshot) -> SearchNounProj in SearchNounProj(snapshot: value) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { (value: [SearchNounProj?]) -> [Snapshot?] in value.map { (value: SearchNounProj?) -> Snapshot? in value.flatMap { (value: SearchNounProj) -> Snapshot in value.snapshot } } }, forKey: "SearchNounProj")
      }
    }

    public struct SearchNounProj: GraphQLSelectionSet {
      public static let possibleTypes = ["Icon"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(String.self)),
        GraphQLField("preview_url_42", type: .scalar(String.self)),
        GraphQLField("preview_url_84", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: String? = nil, previewUrl_42: String? = nil, previewUrl_84: String? = nil) {
        self.init(snapshot: ["__typename": "Icon", "id": id, "preview_url_42": previewUrl_42, "preview_url_84": previewUrl_84])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String? {
        get {
          return snapshot["id"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var previewUrl_42: String? {
        get {
          return snapshot["preview_url_42"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "preview_url_42")
        }
      }

      public var previewUrl_84: String? {
        get {
          return snapshot["preview_url_84"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "preview_url_84")
        }
      }
    }
  }
}

public struct EventDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment EventDetails on Event {\n  __typename\n  name {\n    __typename\n    text\n  }\n  url\n  description {\n    __typename\n    text\n  }\n  start {\n    __typename\n    timezone\n    local\n  }\n  end {\n    __typename\n    timezone\n    local\n  }\n  logo {\n    __typename\n    url\n    original {\n      __typename\n      url\n    }\n  }\n  venue {\n    __typename\n    name\n    latitude\n    longitude\n  }\n}"

  public static let possibleTypes = ["Event"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("name", type: .object(Name.selections)),
    GraphQLField("url", type: .scalar(String.self)),
    GraphQLField("description", type: .object(Description.selections)),
    GraphQLField("start", type: .object(Start.selections)),
    GraphQLField("end", type: .object(End.selections)),
    GraphQLField("logo", type: .object(Logo.selections)),
    GraphQLField("venue", type: .object(Venue.selections)),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(name: Name? = nil, url: String? = nil, description: Description? = nil, start: Start? = nil, end: End? = nil, logo: Logo? = nil, venue: Venue? = nil) {
    self.init(snapshot: ["__typename": "Event", "name": name.flatMap { (value: Name) -> Snapshot in value.snapshot }, "url": url, "description": description.flatMap { (value: Description) -> Snapshot in value.snapshot }, "start": start.flatMap { (value: Start) -> Snapshot in value.snapshot }, "end": end.flatMap { (value: End) -> Snapshot in value.snapshot }, "logo": logo.flatMap { (value: Logo) -> Snapshot in value.snapshot }, "venue": venue.flatMap { (value: Venue) -> Snapshot in value.snapshot }])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var name: Name? {
    get {
      return (snapshot["name"] as? Snapshot).flatMap { Name(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "name")
    }
  }

  public var url: String? {
    get {
      return snapshot["url"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "url")
    }
  }

  public var description: Description? {
    get {
      return (snapshot["description"] as? Snapshot).flatMap { Description(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "description")
    }
  }

  public var start: Start? {
    get {
      return (snapshot["start"] as? Snapshot).flatMap { Start(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "start")
    }
  }

  public var end: End? {
    get {
      return (snapshot["end"] as? Snapshot).flatMap { End(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "end")
    }
  }

  public var logo: Logo? {
    get {
      return (snapshot["logo"] as? Snapshot).flatMap { Logo(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "logo")
    }
  }

  public var venue: Venue? {
    get {
      return (snapshot["venue"] as? Snapshot).flatMap { Venue(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "venue")
    }
  }

  public struct Name: GraphQLSelectionSet {
    public static let possibleTypes = ["EventName"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("text", type: .scalar(String.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(text: String? = nil) {
      self.init(snapshot: ["__typename": "EventName", "text": text])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var text: String? {
      get {
        return snapshot["text"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "text")
      }
    }
  }

  public struct Description: GraphQLSelectionSet {
    public static let possibleTypes = ["EventDescription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("text", type: .scalar(String.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(text: String? = nil) {
      self.init(snapshot: ["__typename": "EventDescription", "text": text])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var text: String? {
      get {
        return snapshot["text"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "text")
      }
    }
  }

  public struct Start: GraphQLSelectionSet {
    public static let possibleTypes = ["Time"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("timezone", type: .scalar(String.self)),
      GraphQLField("local", type: .scalar(String.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(timezone: String? = nil, local: String? = nil) {
      self.init(snapshot: ["__typename": "Time", "timezone": timezone, "local": local])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var timezone: String? {
      get {
        return snapshot["timezone"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "timezone")
      }
    }

    public var local: String? {
      get {
        return snapshot["local"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "local")
      }
    }
  }

  public struct End: GraphQLSelectionSet {
    public static let possibleTypes = ["Time"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("timezone", type: .scalar(String.self)),
      GraphQLField("local", type: .scalar(String.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(timezone: String? = nil, local: String? = nil) {
      self.init(snapshot: ["__typename": "Time", "timezone": timezone, "local": local])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var timezone: String? {
      get {
        return snapshot["timezone"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "timezone")
      }
    }

    public var local: String? {
      get {
        return snapshot["local"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "local")
      }
    }
  }

  public struct Logo: GraphQLSelectionSet {
    public static let possibleTypes = ["ImageObject"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("url", type: .scalar(String.self)),
      GraphQLField("original", type: .object(Original.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(url: String? = nil, original: Original? = nil) {
      self.init(snapshot: ["__typename": "ImageObject", "url": url, "original": original.flatMap { (value: Original) -> Snapshot in value.snapshot }])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var url: String? {
      get {
        return snapshot["url"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "url")
      }
    }

    public var original: Original? {
      get {
        return (snapshot["original"] as? Snapshot).flatMap { Original(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "original")
      }
    }

    public struct Original: GraphQLSelectionSet {
      public static let possibleTypes = ["ImageUrl"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("url", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(url: String? = nil) {
        self.init(snapshot: ["__typename": "ImageUrl", "url": url])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var url: String? {
        get {
          return snapshot["url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url")
        }
      }
    }
  }

  public struct Venue: GraphQLSelectionSet {
    public static let possibleTypes = ["Venue"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .scalar(String.self)),
      GraphQLField("latitude", type: .scalar(String.self)),
      GraphQLField("longitude", type: .scalar(String.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(name: String? = nil, latitude: String? = nil, longitude: String? = nil) {
      self.init(snapshot: ["__typename": "Venue", "name": name, "latitude": latitude, "longitude": longitude])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var name: String? {
      get {
        return snapshot["name"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    public var latitude: String? {
      get {
        return snapshot["latitude"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "latitude")
      }
    }

    public var longitude: String? {
      get {
        return snapshot["longitude"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "longitude")
      }
    }
  }
}
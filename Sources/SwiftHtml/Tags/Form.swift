//
//  Form.swift
//  SwiftHtml
//
//  Created by Tibor Bodecs on 2021. 07. 19..
//

public extension Node {

    static func form(_ children: [Node] = []) -> Node {
        Node(type: .standard, name: "form", children: children)
    }
}

/// The `<form>` tag is used to create an HTML form for user input.
///
/// The `<form>` element can contain one or more of the following form elements:
///
/// - `<input>`
/// - `<textarea>`
/// - `<button>`
/// - `<select>`
/// - `<option>`
/// - `<optgroup>`
/// - `<fieldset>`
/// - `<label>`
/// - `<output>`
public struct Form: Tag {
    public var node: Node

    public init(_ node: Node) {
        self.node = node
    }
    
    public init(_ children: [Node] = []) {
        self.node = .form(children)
    }

    public init(@TagBuilder _ builder: () -> [Tag]) {
        self.init(builder().map(\.node))
    }
}

public extension Form {
    enum Rel: String {
        /// Specifies that the referenced document is not a part of the current site
        case external
        /// Links to a help document
        case help
        /// Links to copyright information for the document
        case license
        /// The next document in a selection
        case next
        /// Links to an unendorsed document, like a paid link.
        /// ("nofollow" is used by Google, to specify that the Google search spider should not follow that link)
        case nofollow
        
        case noopener
        /// Specifies that the browser should not send a HTTP referrer header if the user follows the hyperlink
        case noreferrer
        case opener
        /// The previous document in a selection
        case prev
        /// Links to a search tool for the document
        case search
    }
    
    /// Specifies the character encodings that are to be used for the form submission
    func acceptCharset(_ value: String) -> Self {
        .init(node.addOrReplace(Attribute(key: "accept-charset", value: value)))
    }
    
    /// Specifies where to send the form-data when a form is submitted
    func action(_ value: String) -> Self {
        .init(node.addOrReplace(Attribute(key: "action", value: value)))
    }
    
    /// Specifies whether a form should have autocomplete on or off
    func autocomplete(_ value: Bool = true) -> Self {
        .init(node.addOrReplace(Attribute(key: "autocomplete", value: value ? "on" : "off")))
    }
    
    /// Specifies how the form-data should be encoded when submitting it to the server (only for method="post")
    func enctype(_ value: Enctype) -> Self {
        .init(node.addOrReplace(Attribute(key: "enctype", value: value.rawValue)))
    }
    
    /// Specifies the HTTP method to use when sending form-data
    func method(_ value: Method) -> Self {
        .init(node.addOrReplace(Attribute(key: "method", value: value.rawValue)))
    }
    
    /// Specifies the name of a form
    func name(_ value: String) -> Self {
        .init(node.addOrReplace(Attribute(key: "name", value: value)))
    }
    
    /// Specifies that the form should not be validated when submitted
    func novalidate() -> Self {
        .init(node.addOrReplace(Attribute(key: "novalidate")))
    }
    
    /// Specifies the relationship between a linked resource and the current document
    func rel(_ value: Rel) -> Self {
        .init(node.addOrReplace(Attribute(key: "rel", value: value.rawValue)))
    }
    
    /// Specifies where to display the response that is received after submitting the form
    func target(_ value: Target) -> Self {
        .init(node.addOrReplace(Attribute(key: "target", value: value.rawValue)))
    }
}
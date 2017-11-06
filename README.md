# zendeskSampleCode
### Technical code test for zendesk
## Michel Barbou Salvador
### mibarbou@gmail.com

### Third party libraries used with cocoapods:
* Suas: Zendesk Redux architecture library.
* Alamofire: Api REST library.
* Gloss: JSON serialization library.

Pods libraries are not uploaded in the Repo, use *pod install*


### Project Structure:

* Models:
- API: includes all API rest related classes. *ApiClient*, *Endpoint*, *ApiError*, *Responses*(serialization models), *Mappers*(maps responses to our App models).
- *GuideArticles*, *Article*.

*   Views:
   - ArticleCell.

*  Controllers:
  - *ArticlesTableViewController*: is a TableViewController that includes a SearchController and implements an Infinite Scroll using a ScrollView Delegate.
   
#### Redux architecture with Suas-iOS library
*  *Store:* Global variable that defines the reducers and the midllewares that's gonna be used in the app.
*  *States:* struct model thats gonna be used as the state of the controller. *GuideArticlesState*.
*  *Actions:* actions and async actions dispatched in the controller to be capture by the reducer.
*  *Reducers:* receives the actions to apply the uses cases  and make  possible modifications to the corresponding state. *GuideArticlesReducer*

### Important info:
 * The *Article* Model use an *NSAttributedString* in the *body* property because the string received by the zendesk service is an html string, this conversion used in the *ArticlesMapper* is very costly and not optimal for a tableView, but it's a good way to show how I would use *GCD* in this cases. The App shows an status activity indicator when performing all the network activy and this string to *NSAttributedString* conversion. Every Article request could last more or less 15 seconds in normal conditions.









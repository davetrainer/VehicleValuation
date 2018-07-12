using System.Net.Http;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;

namespace VehicleValuation.Web.Custom
{
    public class AccessAuthoriseAttribute : AuthorizationFilterAttribute
    {
        #region Constants

        #endregion

        #region Constructors

        #endregion

        #region Events & Delegates

        #endregion

        #region Properties

        #endregion

        #region Methods

        public override void OnAuthorization(HttpActionContext actionContext)
        {
            var authorisation = actionContext.Request.Headers.Authorization;

            //Real world scenario: Token auth based on username and password. This is just an example of how to block via AuthorizationFilterAttribute
            if (authorisation == null || !(authorisation.Scheme == "Bearer" && authorisation.Parameter == "john:password"))
            {
                actionContext.Response = actionContext.Request.CreateResponse(
                    System.Net.HttpStatusCode.Forbidden,
                    new[]
                    {
                        "Access Denied"
                    });
            }

            base.OnAuthorization(actionContext);
        }

        #endregion
    }
}
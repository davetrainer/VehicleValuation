using Newtonsoft.Json.Converters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Web.Http.ExceptionHandling;
using VehicleValuation.Web.Custom;

namespace VehicleValuation.Web
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            config.MessageHandlers.Add(new LogHandler());

            // Web API configuration and services
            IsoDateTimeConverter converter = new IsoDateTimeConverter
            {
                DateTimeFormat = "dd/MM/yyyy HH:mm:ss"
            };

            config.Formatters.JsonFormatter.SerializerSettings.Converters.Add(converter);

            config.Services.Replace(typeof(IExceptionHandler), new ApiExceptionHandler());

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
    }
}

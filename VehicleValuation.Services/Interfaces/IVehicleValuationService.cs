using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VehicleValuation.Services.DomainObjects;

namespace VehicleValuation.Services.Interfaces
{
    public interface IVehicleValuationService
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

        VehicleValuationResponse GetVehicleValuation(VehicleValuationRequest request);

        #endregion
    }
}

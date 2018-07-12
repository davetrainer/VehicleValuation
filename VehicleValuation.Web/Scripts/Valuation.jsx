class Valuation extends React.Component {
  constructor(props) {
      super(props);
      this.state = {
          displayErrors: false,
          valuationResponse: null
      }
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(e) {
      e.preventDefault();

      if (!e.target.checkValidity()) {
          this.setState({ displayErrors: true });
          return;
      }
      this.setState({ displayErrors: false });

      fetch('/api/vehiclevaluation/', {
          method: 'POST',
          headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'Authorization': "Bearer john:password" //Aware this is dangerous! For testing purposes only
          },
          body: JSON.stringify({
              VehicleRegistration: this.vrm.value,
              Mileage: this.mileage.value,
              CustomerName: this.customerName.value,
              CustomerEmail: this.customerEmail.value,
              TelephoneNumbers: [
                  this.telNo.value,
                  this.mobile.value
              ]
          })
      }).then(response => {
          if (response.ok) {
              return response.json();
          }
          else {
              alert("Unable to retrive valution");
          }
      }).then(data => this.setState({ valuationResponse: data }));
  }

  render() {
      const { displayErrors } = this.state;
      const { valuationResponse } = this.state;
      
    return(
      <div>
          <div className="floatDiv">
                <form noValidate className={displayErrors ? 'displayErrors' : ''} onSubmit={this.handleSubmit}>
                    <label htmlFor="vrm">Vehicle Registration</label><br />
                    <input id="vrm" type="text" placeholder="Eg AB12 ODE" ref={(vrm) => this.vrm = vrm} required />
                    <label htmlFor="mileage">Mileage</label><br />
                    <input id="mileage" type="number" placeholder="Eg 50000" ref={(mileage) => this.mileage = mileage} required />
                    <label htmlFor="customerName">Customer Name</label><br />
                    <input id="customerName" type="text" placeholder="Eg John Doe" ref={(vrm) => this.customerName = customerName} required />
                    <label htmlFor="vrm">Email Address</label><br />
                    <input id="customerEmail" type="email" placeholder="Eg John@gmail.com" ref={(customerEmail) => this.customerEmail = customerEmail} required />
                    <label htmlFor="telNo">Tel No.</label><br />
                    <input id="telNo" type="tel" pattern="^[0-9-+s()]*$" placeholder="Eg 01902555555" ref={(telNo) => this.telNo = telNo} required />
                    <label htmlFor="mobile">Mobile</label><br />
                    <input id="mobile" type="tel" pattern="^[0-9-+s()]*$" placeholder="Eg 0771234567" ref={(mobile) => this.mobile = mobile} required />
                    <p>
                        <button type="submit">Submit</button>
                    </p>
                </form>
            </div>
            <div className="floatDiv">
                <p><b>{ valuationResponse ? 'Your valuation': ''}</b></p>
                <p>{ valuationResponse ? 'Valuation Date: ' + valuationResponse.ValuationDate: ''}</p>
                <p>{ valuationResponse ? 'Expiry Date: ' + valuationResponse.ExpiryDate: ''}</p>
                <p>{ valuationResponse ? 'Guide Price: £' + valuationResponse.GuidePrice: ''}</p> 
            </div>
      </div>
    );
  }
};

ReactDOM.render(
  <Valuation />,
  document.getElementById('content')
);
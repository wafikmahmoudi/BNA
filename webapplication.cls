Class Home.webapplication Extends %CSP.REST
{

Parameter HandleCorsRequest = 1;

Parameter CONTENTTYPE = "application/json+fhir";

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
          <Route Url="/" Method="GET" Call="testwafik" />
          <Route Url="/Observation/:id" Method="GET" Call="ListObservationsByPatient" />
          <Route Url="/:id" Method="GET" Call="GetPatientByID" />
          <Route Url="/api/Patient/" Method="GET" Call="GetPatientAPI" />
           <Route Url="/APIpatient/" Method="GET" Call="GetPatientOS" />
        </Routes>
}

ClassMethod testwafik() As %Status
{
    w "hello test wafik 1"

	Set tArr = []
        Set rs = ##class(%SQL.Statement).%ExecDirect(,"SELECT ID, %Source, NewField1, NewField2 FROM User_test4.Record")
        While rs.%Next() {
        set NewField1 = rs.%Get("NewField1")
        set NewField2 = rs.%Get("NewField2")

           Do tArr.%Push({
          
            "NewField1":         (NewField1),
             "NewField2" :  (NewField2)
            
          })
        }


  Write tArr.%ToJSON()
    Quit $$$OK
}

}

# C Sharp MVC5, EF6 and Web API's in one project

I watch the videos, then build the software to teach myself.

Complete the Global Variable.cs file

https://www.youtube.com/watch?v=iublAXAm8HQ

Install the API Client manager,

In order to call Web API methods inside the MVC project, you have to 
create an object of HTTP Client Class,

If you use the it for each call, it will crash under heavy loads,
this will result in socket exception errors.

So create a Public Static Class, inside that I will create a 
HTTP Client Object.

RC MVC Project, add Class, name it Global Variables, set the class as 
static class, here build the HTTP Client object. 
public static HttpClient MikesWebApiClient = new HttpClient();

Then build the GlobalVariables() to put the base address in.
RC WebApi Project, Properties, Web Section, copy the Project
Uri for IIS Express, then paste it into your GlobalVariables(). 

static GlobalVariables()
        {
            //paste in the Web IIS link.
            MikesWebApiClient.BaseAddress = new Uri("http://localhost:54485/api");
            //set the default request headers.
            MikesWebApiClient.DefaultRequestHeaders.Clear();
            //set the media type as json.
            MikesWebApiClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

            //now I can use the http client inside the MVC Controllers.
        }

//------------------------

*Next build the controller:

public class EmployeeController : Controller
    {
        // GET: Employee
        public ActionResult Index()
        {
            //object of employee model.
            IEnumerable<MvcEmployeeModel>empList;
            //now call the Web APIs inside the MVC project, with a HTTP response method.
            HttpResponseMessage response = GlobalVariables.MikesWebApiClient.GetAsync("Employee").Result;
            //convert the "result" into "IEnumerable". 
            empList = response.Content.ReadAsAsync<IEnumerable<MvcEmployeeModel>>().Result;
            //pass the "empList" into the View.
            return View(empList);
        }
    }

// in this I will list the Employees from the Employees table, by consuming the HTTP method 
// inside the WebApi Controller called Get Employees. RC add View called Index.

// I have to install the Web API Client from NuGet Package Manager, to use the Web APIs HTTP methods 
// inside my MVC Project. RC MVC Project, Package Manager, search for the Web API Client and Install.

//NOTE!
// In order to call Web API methods inside my MVC Project, I have to create an object of the HTTP Client Class.

//-----------------------

*Next both projects MVC and the Web APIs should be in one status, set them by changing the startup config for the solution:
RC Solution, Properties, Set multiple startup projects, set START as the action for both projects in the drop downs, apply and ok.

*Next run the projects, check which one is which. RC Project, properties, web tab, check the URL, 
close the API one http://localhost:54485/.

* Navigate to the Employee controller in the MVC app here: http://localhost:54501/Employee.

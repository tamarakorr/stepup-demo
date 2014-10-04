# StepUp Demo
Created 24 August 2014  
Last reviewed 4 October 2014

This is the [*StepUp Demo*](https://stepup-demo.herokuapp.com)  
  designed by [Tammy Orr, Ivan Mani, and Charlotte Fisher](http://www.endsvchack.com/projects/stepup),  
  coded by Tammy Orr and Sri Vishnu Totakura.

## Unimplemented Functionality
###Needed for Demo

* Messaging system (proposals) (partially implemented)  
* We own www.stepupvolunteers.com, but it is not configured properly to route to Heroku.
* 'More info' static page has not been written yet.  
* 'Post Skill' menu item does nothing.  

###New Issues
* If user is not signed in, clicking Browse Volunteers should redirect to Browse Volunteers after successful sign-in (instead of profile page)
* '1 volunteers' or '1 vacancies' text if filters result in one record - should use pluralize()
* Google Maps tooltips - mouseout function is commented - why?
* 'Make a Proposal' for a vacancy when logged in as an NGO leads to error page
* Lots of failing tests

###Tammy's List
####Changes Complete
* Update text for Make Proposal/Submit Proposal buttons  
* Submit Proposal screen  
  Font for 'Message' textarea doesn't match other text inputs
* User registration  
  Terms and Conditions checkbox tiny (doesn't match other checkboxes)
* Placeholders are missing from some screens  

###Not needed for demo (?)
* Corporate reporting/analytics system
* 'Sign in with LinkedIn' unimplemented  
* Clicking a 'Top Vacancy' on Home page should probably lead to those vacancies  
* The site looks awful on small screens/old browsers  
* Corporate profiles  
* Map labels do not group when many labels are in a small area (plugins to do this quickly are expensive)  
* Terms and conditions have not been written
* Hovering on map labels - consider tablet/mobile view (no hover) (probably not needed for demo)  
* Browse volunteers and browse vacancies - lists should look much better when graphics are added  

## Implemented
* 'I have read these Terms and Conditions...' checkbox must be checked to register  
* Browse volunteers and browse vacancies:  
  Filter -> 'Apply' buttons work  
  Vacancies can now be sorted by NGO  
* Hovering on a map label now shows more info (& larger font)  
* 'Post Vacancy' bug is fixed  

## Developer notes


### Design issues
* Most input fields are unrestricted string fields without constraints
* Many input fields should be dropdowns  
  We do not have finalized option lists for them  
  Bootstrap dropdown boxes look awful (perhaps not a worry for demo)

### Known Sloppiness  
* Some lazy `'style='` HTML tags remain in static_pages/home.html.erb  
* There may be some "TODO"s in the code  
* Some code which might be useful later is commented  

## Messaging System
###Notes  

* A number badge or different graphic should show a signed-in user's inbox status (empty vs. not empty).  
* The messaging system is an internal part of StepUp.
* We expect to restrict/paywall the pieces of information sent.  
  However, for the demo we may allow freeform text messages.  

###Volunteers can see two types of messages:  

* My vacancy proposals (sent messages)  
* NGO responses to my vacancy proposals (received messages)  

###NGOs can see two types of messages:  

* My responses to volunteer proposals (sent messages)  
* Volunteer proposals for vacancies (received messages)  

## User Access

### Unregistered User
Unregistered users may:  

* Browse vacancies  
* Register  
* Log in  

The following actions will lead to the login/registration page:  

* Attempting to browse volunteers  
* Attempting to create a vacancy or post a skill  
* Attempting to make a proposal for a vacancy

### Generic Registered User (no volunteer, NGO, or corporate profile)  
This user may:  

* Do everything an Unregistered User can do  
* Create own volunteer, NGO, or corporate profile  
* Check messages  
* Sign out  

The same actions that prompt an unregistered user, will also prompt this user to create their volunteer, NGO, or corporate profile.

### Signed-in volunteer
This user may:  

* Do everything a generic registered user can do
* Make a vacancy proposal (not implemented)  
* Edit own profile  
* List own profile  
* Unlist own profile  

### Signed-in NGO
This user may:  

* Do everything a generic registered user can do
* Browse volunteers  
* Edit own profile  
* View own vacancies  
* Post a vacancy  
* Edit own vacancy  
* Send a message to a volunteer (not implemented)  

### Signed-in Corporate
(Not needed for demo)

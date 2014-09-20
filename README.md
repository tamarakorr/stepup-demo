# StepUp Demo
Created 24 August 2014
Last reviewed 20 September 2014

This is the [*StepUp Demo*](http://www.example.com)
by [Tammy Orr, Ivan Mani, and Charlotte Fisher](http://www.endsvchack.com/projects/stepup).

## Unimplemented Functionality
###Needed for Demo

* Messaging system (proposals)  
* We own www.stepupvolunteers.com, but it is not configured properly to route to Heroku
* 'I have read these Terms and Conditions...' checkbox is ignored on registration page  
* Browse volunteers and browse vacancies:  
  Filter -> 'Apply' button does not yet do anything  
  (Lists will look much better when graphics are added)  
* Hovering on a map label should show more info (& larger font)  
  Consider tablet/mobile view (no hover) (probably not needed for demo)  
* Vacancies cannot currently be sorted by NGO  
  (I couldn't quickly determine the best-practice way to do it in Rails)  
* 'More info' static page has not been written yet  
* 'Post Skill' menu item does nothing  
* 'Post Vacancy' is getting an error when user not signed in (tko - got in a hurry and broke it this morning 20 Sept)  

###Tammy's List
* Placeholders are missing from some screens (quick job - I will fill in)  

###Not needed for demo (?)
* Corporate reporting/analytics system
* 'Sign in with LinkedIn' unimplemented  
* Clicking a 'Top Vacancy' on Home page should probably lead to those vacancies  
* The site looks awful on small screens/old browsers  
* Corporate profiles  
* Map labels do not group when many labels are in a small area (plugins to do this quickly are expensive)  
* Terms and conditions have not been written

## Developer notes

###IMPORTANT

* The most recent version of one of the SASS-related gem dependencies (from August 28ish) causes the CSS files to fail to compile. (The problem seems to be an error in the new SASS gem or in one of the Bootstrap files.) I've read the Bootstrap files have a missing semicolon somewhere, which might be the problem. But I could not find it. I am avoiding 'bundle update' and using the pre-August-28 SASS dependency for the time being.  

* Heroku assets need to be precompiled so that Heroku doesn't try to 'bundle update'. ('Bundle update' results in the CSS error mentioned above, which causes deployment failure.) Before every push, manually precompile as follows:  
```
rm -rf tmp/*  
rm -rf public/assets/*  
RAILS_ENV=production rake assets:precompile --trace  
```
and then of course:  
```
(git add ., git commit, git push (--all), git push (-f) heroku branch-name:master)  
```

This of course makes a mess in git. So please do it as its own separate commit (i.e. `git commit -am 'Precompile assets for Heroku'`).

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

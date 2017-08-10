# VERSION-CHECKER web platform

Version checker is an EDM (electronic document management) which provides smart functionalities for professionals.
Its main aim is to manage the versions of pdf documents which are used for paper version plotting. It integrates into the pdf files a QR-Code which can be read by a dedicated mobile app to check on site if the document is up-to-date.

## Short changelog
*v0.0.1* (July 2017)
- Initial version

## Dependencies
* pundit, right management (https://github.com/elabs/pundit)
* CarrierWave, files storage management (https://github.com/carrierwaveuploader/carrierwave)
* rqrcode, QR-Code generator (https://github.com/whomwah/rqrcode)
* prawn, pdf files manipulator (https://github.com/prawnpdf/prawn)
* combine\_pdf, merge pdf files (https://github.com/boazsegev/combine_pdf)

## Tests
To run tests 
```ruby
$ rails t
```

## Context of the project
This project has been made as a personnal work by Olivier Francey for the module FRM (FrameWork) in the MAS-RAD program.

scriptencoding utf8
" Vim syntax file
" Language: icalendar <http://www.ietf.org/rfc/rfc2445.txt>
" Current Maintainer: Václav Kubernát <vaclav@kubern.at>
" Previous Maintainer: Steven N. Severinghaus <sns@severinghaus.org>
" Last Modified: 2022-09-07
" Version: 0.4

" Quit if syntax file is already loaded
if v:version < 600
    syntax clear
elseif exists('b:current_syntax')
    finish
endif

command! -nargs=+ IcalHiLink hi def link <args>

syntax case ignore
setlocal iskeyword+=-

syn match	icalObject	/^\(BEGIN\|END\)/
syn match	icalObjectType	/:\(VCALENDAR\|VEVENT\|VTODO\|VJOURNAL\|VFREEBUSY\|VTIMEZONE\|VALARM\)/
syn match	icalObjectType	/:\(DAYLIGHT\|STANDARD\)/
syn match	icalProperty	/^\(DTSTART\|PRODID\|VERSION\|CALSCALE\|METHOD\)/
syn match	icalProperty	/^\(DTEND\|DTSTAMP\|ORGANIZER\|UID\|CLASS\|CREATED\)/
syn match	icalProperty	/^\(LOCATION\|SEQUENCE\|STATUS\|SUMMARY\|COMMENT\)/
syn match	icalProperty	/^\(TRANSP\|ATTENDEE\|ATTACH\|FREEBUSY\|METHOD\|CONTACT\)/
syn match	icalProperty	/^\(DURATION\|RRULE\|EXDATE\|EXRULE\|URL\|DESCRIPTION\|ACTION\)/
syn match	icalProperty	/^\(LAST-MODIFIED\|RECURRENCE-ID\|TRIGGER\|RELATED-TO\|RDATE\)/
syn match	icalProperty	/^\(TZID\|TZOFFSETFROM\|TZOFFSETTO\|TZNAME\|TZURL\)/
syn match	icalProperty	/^\(PRIORITY\|DUE\|COMPLETED\|PERCENT-COMPLETE\|CATEGORIES\)/
syn match	icalProperty	/^\(RESOURCES\|REPEAT\|REQUEST-STATUS\)/
syn match	icalProperty	/^\(PARTSTAT\)/
syn match	icalCustom	/^X-[A-Z-]\+/
syn match	icalDate	/[0-9].......T[0-9].....Z\=/
syn match	icalParameter	/[A-Z0-9-]\+=[^;:]\+/
syn keyword	icalSetValue	CONFIRMED TENTATIVE CANCELLED DELEGATED OPAQUE
syn keyword	icalSetValue	NEEDS-ACTION ACCEPTED DECLINED IN-PROGRESS
syn keyword	icalSetValue	PRIVATE PUBLIC PUBLISH GREGORIAN DISPLAY
syn match	icalSetValue	/:COMPLETED$/

IcalHiLink	icalProperty	Statement
IcalHiLink	icalCustom	Statement
IcalHiLink	icalObject	Label
IcalHiLink	icalObjectType	Identifier
IcalHiLink	icalDate	Number
IcalHiLink	icalParameter	Comment
IcalHiLink	icalSetValue	Constant

delcommand IcalHiLink

let b:current_syntax = 'icalendar'

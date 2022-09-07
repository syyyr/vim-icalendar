augroup icalendar-detect
    autocmd!
    autocmd! BufRead,BufNewFile *.ics setfiletype icalendar
augroup END

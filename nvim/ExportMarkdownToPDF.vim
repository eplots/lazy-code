function! ExportMarkdownToPDF()
    let l:input_file = expand('%')  " Hämtar det aktuella filnamnet
    let l:output_file = input('Ange filnamn för PDF: ', expand('%:r') . '.pdf', 'file')
    if l:output_file == ''
        echo 'Inget filnamn angivet. Export avbruten.'
        return
    endif
    let l:command = 'python3 /path/to/your/script/md_to_pdf.py ' . shellescape(l:input_file, 1) . ' ' . shellescape(l:output_file, 1)
    execute '!' . l:command
    echo 'PDF genererad: ' . l:output_file
    " Lägg till ett kommando för att öppna PDF med Zathura
    if filereadable(l:output_file)
        silent execute '!zathura ' . shellescape(l:output_file, 1) . ' &'
        redraw!
    endif
endfunction

command! ExportToPDF call ExportMarkdownToPDF()
nnoremap <F7> :ExportToPDF<CR>

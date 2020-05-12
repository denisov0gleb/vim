' How execute:
' converter.vbs полный_путь_к_файлу\имя_файла.docx полный_путь_куда_сохранить\имя_файла_без_расширения

' Wscript.Arguments.Item(0) — полный_путь_к_файлу\имя_файла.docx
' WScript.Arguments.Item(1) — полный_путь_сохранения\имя_файла_без_расширения

' Saving types:
' 0 .doc
' 2 .txt
' 6 .rtf
' 7 .txt in unicode
' 8 .html
' 16 default: .docx
' 17 .pdf

Const wdFormatText = 2

' Open Word
Set objWord = CreateObject("Word.Application")

' Add this to see the opening process
objWord.Visible = TRUE

' Instead of "try catch"
On Error Resume Next

' Open twice to ignore some errors
Set objDoc = objWord.Documents.Open(Wscript.Arguments.Item(0), True)
Set objDoc = objWord.Documents.Open(Wscript.Arguments.Item(0), True)

objDoc.SaveAs WScript.Arguments.Item(1), wdFormatText
objWord.Quit


' For Open/LibreOffice:
' ext = 'html'
' os.chdir(oo_path)
' try:
    ' subprocess.check_call(oo_executable + ' --headless --convert-to ' + ext + ' --outdir ' + destPath + ' ' + srcFile, shell=True)
' except subprocess.CalledProcessError as e:
    ' print(e.output)

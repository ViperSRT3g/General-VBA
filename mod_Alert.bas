Attribute VB_Name = "mod_Alert"
Option Explicit

Private Declare Function sndPlaySound32 Lib "winmm.dll" Alias "sndPlaySoundA" (ByVal lpszSoundName As String, ByVal uFlags As Long) As Long

Public Function Alert(ByVal Prompt As String, Optional Buttons As VbMsgBoxStyle, Optional ByVal Title As String, Optional SoundPath As String, Optional SoundFlag As Long = 1) As VbMsgBoxResult
    Call Sound(SoundPath, SoundFlag)
    Alert = MsgBox(Prompt, Buttons, Title)
End Function

Public Function Sound(ByVal FilePath As String, Optional ByVal Flag As Long = 1) As Boolean
    If Len(FilePath) > 0 Then
        Dim FSO As Object: Set FSO = CreateObject("Scripting.FileSystemObject")
        If FSO.FileExists(FilePath) Then Sound = sndPlaySound32(FilePath, Flag)
        Set FSO = Nothing
    End If
End Function

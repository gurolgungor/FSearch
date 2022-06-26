unit FSearchU1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  Vcl.WinXCtrls, Vcl.Grids, BWFileFinder, RxToolEdit, RxCtrls, Vcl.ComCtrls,
  RxRichEd, System.ImageList, Vcl.ImgList;

type
  TForm1 = class(TForm)
    SearchBox1: TSearchBox;
    BWFileFinder1: TBWFileFinder;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    DirectoryEdit1: TDirectoryEdit;
    RxRichEdit1: TRxRichEdit;
    StatusBar1: TStatusBar;
    RxColorButton1: TRxColorButton;
    ImageList1: TImageList;
    procedure SearchBox1InvokeSearch(Sender: TObject);
    procedure RxColorButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.RxColorButton1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.SearchBox1InvokeSearch(Sender: TObject);
begin
  if (SearchBox1.Text<>'Aranacak Dosya ismini Girin') then
  Begin
    if (DirectoryEdit1.EditText='Dizin Seçin...') or (Trim(DirectoryEdit1.EditText)='') Then
    Begin
      showmessage('Dizin seçmeden arama yapamazsýnýz...');
    End
    Else
    Begin
      RxRichEdit1.Clear;
      Searchbox1.ReadOnly :=True;
      StatusBar1.SimpleText :='Arama Baþladý...Lütfen Bekleyin.('+DirectoryEdit1.EditText+')';
      StatusBar1.Refresh;
      BWFileFinder1.Path:=DirectoryEdit1.EditText;
      BWFileFinder1.FileMask := Searchbox1.Text;
      RxRichEdit1.Lines:=BWFileFinder1.SearchForFiles;
      StatusBar1.SimpleText :='Arama Bitti...';
      StatusBar1.Refresh;
      Searchbox1.ReadOnly :=False;
    End;
  End
  Else
  Begin
    showmessage('Dosya ismi girmeden arama yapamazsýnýz...');
  End;
end;

end.

unit formOpenFile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, DB, ADODB, GridsEh, DBGridEh,ShellAPI;

type
  TfrmOpenFile = class(TForm)
    Dgh1: TDBGridEh;
    Dt1: TADODataSet;
    ds1: TDataSource;
    dlgOpen1: TOpenDialog;
    procedure Dgh1DblClick(Sender: TObject);
    procedure Dgh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOpenFile: TfrmOpenFile;

implementation

//uses   DMUnit;

{$R *.dfm}

procedure TfrmOpenFile.Dgh1DblClick(Sender: TObject);
var
 lAppName,
  lParam: PChar;
begin
  //lAppName := 'd:\xxx\des.exe';
  lAppName :=PChar(Dt1.fieldByName('FileDir').asstring );
  lParam := '';
  ShellExecute(0, nil,(lAppName ), lParam, nil, SW_SHOWNORMAL);
 // ShellExecute(handle, 'open', '你的程序某文件夹下的exe绝对路径',nil,nil,SW_SHOWNORMAL);
 //ShellExecute(Self.Handle, 'Open', 'ProShell.exe', PChar('Hello World'), PChar('D:\software\97格斗'), SW_SHOWNORMAL);
end; 



procedure TfrmOpenFile.Dgh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin

if (Sender as TDBGridEh).SumList.RecNo mod 2 = 1 then     // .SumList
   Background := $00FFC4C4;
  { else                              //   设置行的  原色
   Background := $00FFDDDD;   }

end;

procedure TfrmOpenFile.FormCreate(Sender: TObject);
begin
// FormCaption('data0841' ,Self);
// addfixFields('data0841',Self.Dgh1,' where 1=2');
//
// ColNotVisi(Dgh1,['TableName','RKey']);
end;

end.

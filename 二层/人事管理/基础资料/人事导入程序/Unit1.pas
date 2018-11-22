unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls, Grids, Menus, OleServer, Excel2000,
  ComObj,ComCtrls, Provider;
type
  TFrm_main = class(TForm)
    OpenDialog1: TOpenDialog;
    BitBtn1: TBitBtn;
    StringGrid1: TStringGrid;
    procedure BitBtn1Click(Sender: TObject);
  private
    FTag : Integer;
    field_name:string;
    sSql :string;
    procedure ExcelToDB;
  public
    { Public declarations }
  end;

var
  Frm_main: TFrm_main;

implementation
uses common,ConstVar;
{$R *.dfm}

procedure TFrm_main.ExcelToDB;
var
  fileName:String;
  iCount,limit: Integer;
  tmp1 : Single;
  XLApp: variant;
  Sheet: Variant;
begin
   if OpenDialog1.Execute then  fileName:=OpenDialog1.FileName else exit;
   Screen.Cursor := crHourGlass;
   if not VarIsEmpty(XLApp) then
   begin
        XLApp.DisplayAlerts := False;
        XLApp.Quit;
        VarClear(XLApp);
   end;
   try
        XLApp := CreateOleObject('Excel.Application');
        limit := 0;
   except
        Screen.Cursor := crDefault;
        Exit;
   end;
  
  try
       XLApp.workBooks.Open(fileName);
       Sheet := XLApp.Workbooks[1].WorkSheets[1];
       for iCount:=2 to 65535 do
       begin
                 if (trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]) <> '') and (trim(XLApp.workbooks[1].sheets[1].cells[iCount,2]) <> '') then
                 begin

                 end
                 else begin
                       Inc(limit);
                       if limit >= 6 then
                       Break;
                 end;
       end;
       XLApp.workbooks[1].close;
  finally
       XLApp.quit;
       Screen.Cursor := crDefault;
       DM.ADOBER.EnableControls;
  end;

   QueryTmp.Free;
   detail_form.Free;
   Self.BitBtn7Click(nil);
end;

procedure TFrm_main.BitBtn1Click(Sender: TObject);
begin
ExcelToDB
end;

end.

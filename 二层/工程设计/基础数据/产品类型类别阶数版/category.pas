unit category;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, ADODB, Grids, DBGridEh, ExtCtrls;

type
  TFrm_Category = class(TForm)
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    ADO619: TADOTable;
    DBGridEh1: TDBGridEh;
    ADO619category: TStringField;
    ADO619category_name: TWideStringField;
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Category: TFrm_Category;

implementation

uses demo,common;

{$R *.dfm}

procedure TFrm_Category.FormShow(Sender: TObject);
begin

  if strtoint(vprev)<>4 then
  begin

    DBGridEh1.ReadOnly:=True;
  end;
  ADO619.Open;
end;

procedure TFrm_Category.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if strtoint(vprev)=4 then
  begin
    if (key=46) and (ssCtrl in shift) then
    begin
      with dm.ADOQuery1 do
      begin
        close;
        sql.Text:='delete data0619 where category='
                          +quotedstr(ADO619category.Value);
        ExecSQL;
        ADO619.Close;
        ADO619.Open;
      end;
    end;
    if (key=46) and (ssCtrl in shift) then Abort;
  end;
end;
end.




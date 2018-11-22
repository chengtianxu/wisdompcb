unit MaintenanceCycleSetting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, ADODB, Grids, DBGridEh, ExtCtrls;

type
  TFrm_MaintenanceCycleSetting = class(TForm)
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    ADO816: TADOTable;
    DBGridEh1: TDBGridEh;
    ADO816Rkey: TWordField;
    ADO816MainCycl: TStringField;
    ADO816cycl_duration: TIntegerField;
    ADO816InteTime: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_MaintenanceCycleSetting: TFrm_MaintenanceCycleSetting;

implementation

uses damo,common;

{$R *.dfm}

procedure TFrm_MaintenanceCycleSetting.FormShow(Sender: TObject);

begin
  
  if strtoint(vprev)<>4 then
  begin

    DBGridEh1.ReadOnly:=True;
  end;

  ADO816.Open;
end;

procedure TFrm_MaintenanceCycleSetting.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if strtoint(vprev)=4 then
  begin
    if (key=46) and (ssCtrl in shift) then
    begin
      with dm.ADOQuery1 do
      begin
        close;
        sql.Text:='delete data0816 where MainCycl='
                          +quotedstr(ADO816MainCycl.Value);
        ExecSQL;
        ADO816.Close;
        ADO816.Open;
      end;
    end;
    if (key=46) and (ssCtrl in shift) then Abort;
  end;
end;

end.




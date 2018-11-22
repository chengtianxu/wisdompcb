unit pasSetFieldName;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, DB,DBClient;

type
  TfrmSetFieldName = class(TForm)
    Panel5: TPanel;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Rkey419:Integer;
  end;

var
  frmSetFieldName: TfrmSetFieldName;

implementation

uses damo,common;

{$R *.dfm}

procedure TfrmSetFieldName.FormShow(Sender: TObject);
begin
  try
    DM.Ado0849.DisableControls;
    DM.Ado0849.Close;
    DM.Ado0849.Parameters.ParamByName('D419_ptr').Value:=Rkey419;
    DM.Ado0849.Parameters.ParamByName('D073_ptr').Value:=rkey73;
    DM.Ado0849.Prepared;
    DM.Ado0849.Open;
    if not dm.Ado0849.IsEmpty then
      DM.CDS2.Data:=DM.DSP2.Data
    else
    begin

    end;
  finally
    DM.Ado0849.EnableControls;
  end;
end;

procedure TfrmSetFieldName.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=40) and        //如果是下箭头如果是最后一条记录
  (DM.CDS2.RecNo=DM.CDS2.RecordCount) then abort;
 if key=45 then abort; //insert键
 if (key=46) and (ssCtrl in shift) then abort;//删除记录
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.Ado0849.SQL.Text);
end;

procedure TfrmSetFieldName.BitBtn5Click(Sender: TObject);
var i:Integer;
begin
  if not DM.CDS2.IsEmpty then
  begin
    try
      DM.CDS2.DisableControls;
      DM.tmp.Close;
      dm.tmp.SQL.Clear;
      dm.tmp.SQL.Text:='delete from data0849 where D419_ptr='+inttostr(Rkey419)+' and D073_ptr='+rkey73;
      dm.tmp.ExecSQL;
      i:=1;
      dm.Ado849s.Close;
      dm.Ado849s.Open;
      dm.CDS2.First;
      while not dm.CDS2.Eof do
      begin
        DM.Ado849s.Append;
        DM.Ado849s.FieldByName('D419_ptr').Value:=Rkey419;
        DM.Ado849s.FieldByName('D073_ptr').Value:=StrToInt(rkey73);
        DM.Ado849s.FieldByName('FormName').Value:=dm.CDS2.FieldByName('FormName').Value;
        DM.Ado849s.FieldByName('GridName').Value:=dm.CDS2.FieldByName('GridName').Value;
        DM.Ado849s.FieldByName('FieldName').Value:=dm.CDS2.FieldByName('FieldName').Value;
        DM.Ado849s.FieldByName('FieldCaption').Value:=dm.CDS2.FieldByName('FieldCaption').Value;
        DM.Ado849s.FieldByName('FieldOrder').Value:=dm.CDS2.FieldByName('FieldOrder').Value;
//        DM.Ado849s.FieldByName('FieldOrder').Value:=i;
        DM.Ado849s.FieldByName('FieldWidth').Value:=dm.CDS2.FieldByName('FieldWidth').Value;
        if (dm.CDS2.FieldByName('IsDisplay').Value=True) then
          DM.Ado849s.FieldByName('IsDisplay').Value:=True
        else
          DM.Ado849s.FieldByName('IsDisplay').Value:=False;
        DM.Ado849s.Post;
        Inc(i);
        dm.CDS2.Next;
      end;
    finally
      DM.CDS2.EnableControls;
    end;
  end;

  modalresult:=mrok;
end;

end.

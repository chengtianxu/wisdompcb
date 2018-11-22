unit UInv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, DB, ADODB, StdCtrls, Buttons, common,
  Provider, DBClient;

type
  TInv_Form = class(TForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    ADO136: TADOQuery;
    DataSource1: TDataSource;
    ADO136RKEY: TAutoIncField;
    ADO136INV_PART_NUMBER: TStringField;
    ADO136INV_PART_DESCRIPTION: TStringField;
    ADO136UNIT_NAME: TStringField;
    ADO136WAREHOUSE_CODE: TStringField;
    ADO136DEPT_CODE: TStringField;
    CheckBox1: TCheckBox;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    ADO136isSel: TBooleanField;
    CDS136: TClientDataSet;
    DSP136: TDataSetProvider;
    ADO136group_id: TWordField;
    BitBtn1: TBitBtn;
    ADO136stan_consume: TBCDField;
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure ADO136AfterOpen(DataSet: TDataSet);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
  procedure update_136(check:boolean);
    { Private declarations }
  public
    flag : integer;
    closeorder:Boolean;
    { Public declarations }
  end;

var
  Inv_Form: TInv_Form;

implementation

{$R *.dfm}

procedure TInv_Form.FormShow(Sender: TObject);
begin
ADO136.close;
ADO136.Open;
BitBtn1.Visible := False;
BitBtn2.Visible := True;
end;

procedure TInv_Form.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=40) and        //如果是下箭头如果是最后一条记录
  (datasource1.DataSet.RecNo=datasource1.DataSet.RecordCount) then abort;
 if key=45 then abort; //insert键
 if (key=46) and (ssCtrl in shift) then abort;//删除记录
end;

procedure TInv_Form.Button1Click(Sender: TObject);
begin
showmsg(ADO136.sql.Text,1);
end;

procedure TInv_Form.update_136(check:boolean);
begin
cds136.First;
cds136.DisableControls;
  while not cds136.Eof do
  begin
      cds136.Edit;
      cds136.FieldValues['issel']:=check;
      cds136.Next;
 end;
cds136.First;
cds136.EnableControls;
end;

procedure TInv_Form.ADO136AfterOpen(DataSet: TDataSet);
begin
cds136.Data:=dsp136.Data;
end;

procedure TInv_Form.CheckBox1Click(Sender: TObject);
begin
self.update_136(checkbox1.Checked);
end;

procedure TInv_Form.BitBtn2Click(Sender: TObject);
var i,j,k: Integer;
 unitn : array[0..255] of string;
 groupid : array[0..1024] of Integer;
 label 1;
begin
  i:= 0;
  flag:= 0;
  closeorder :=true;
  fillchar(groupid,sizeof(groupid),#0);
  fillchar(unitn,sizeof(unitn),#0);
  cds136.First;
  cds136.DisableControls;
  while not Inv_Form.cds136.Eof do
  begin
    cds136.Edit;
    if  cds136.FieldByName('issel').AsBoolean then
          begin
           unitn[i] := cds136.FieldByName('UNIT_NAME').AsString;
           groupid[i] := cds136.FieldByName('group_id').AsInteger;
           i := i + 1;
          end;
          cds136.Edit;
          cds136.Next;
  end;
for  k:=0 to i-1 do
begin
  for j:= 0 to i-2 do
     if unitn[k]<>unitn[j] then
        begin
        showmessage('不同单位的材料不能同时选择');
        DBGridEh1.SetFocus;
        flag := 1;
        goto 1;
                end else  if groupid[k]<>groupid[j] then
                  begin
                      showmessage('不同组别的材料不能同时选择');
                      DBGridEh1.SetFocus;
                      flag := 1;
                      goto 1;
                  end;
 end;
   1: ;
   cds136.First;
   cds136.EnableControls;
 if flag = 0 then
 begin
   BitBtn2.Visible := False;
   BitBtn1.Visible := True;
   BitBtn1.Click;
 end else begin
              BitBtn2.Visible := True;
              BitBtn1.Visible := False;
          end;
end;

end.

unit PasMeasure;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmMeasure = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtMeasure_1: TEdit;
    edtMeasure_2: TEdit;
    edtMeasure_3: TEdit;
    edtMeasure_4: TEdit;
    edtMeasure_5: TEdit;
    edtMeasure_6: TEdit;
    edtMeasure_7: TEdit;
    edtMeasure_8: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    edtCount: TEdit;
    Label11: TLabel;
    procedure FormShow(Sender: TObject);
    procedure edtMeasure_1KeyPress(Sender: TObject; var Key: Char);
    procedure edtMeasure_1Exit(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    status:Integer;
    { Public declarations }
  end;

var
  frmMeasure: TfrmMeasure;

implementation

uses DAMO;

{$R *.dfm}

procedure TfrmMeasure.FormShow(Sender: TObject);
begin
//  if status=2 then
//  begin
//    frmMeasure.Caption:='编辑测量数据';
//    with DM.adoTmp do
//    begin
//      Close;
//      SQL.Clear;
//      SQL.Text:='select rkey391, sr_no, value_1, value_2, value_3, value_4, value_5, '+
//                ' value_6, value_7, value_8 from data0392 '+ #13+
//                ' where rkey391='+ DM.adoAuxrkey391.AsString +' and sr_no='+ DM.adoAuxsr_no.AsString;
//      Open;
//      if not IsEmpty then
//      begin
//        edtCount.Text:= FieldByName('sr_no').AsString;
//        edtMeasure_1.Text:= FieldByName('value_1').AsString;
//        edtMeasure_2.Text:= FieldByName('value_2').AsString;
//        edtMeasure_3.Text:= FieldByName('value_3').AsString;
//        edtMeasure_4.Text:= FieldByName('value_4').AsString;
//        edtMeasure_5.Text:= FieldByName('value_5').AsString;
//        edtMeasure_6.Text:= FieldByName('value_6').AsString;
//        edtMeasure_7.Text:= FieldByName('value_7').AsString;
//        edtMeasure_8.Text:= FieldByName('value_8').AsString;
//      end;
//    end;
//    edtCount.Enabled:=False;
//  end;
end;

procedure TfrmMeasure.edtMeasure_1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Sender as TEdit).Name='edtCount' then
    if not (Key in ['0'..'9',#8]) then Abort;
  if not (Key in ['0'..'9',#46,#8]) then Abort;
end;

procedure TfrmMeasure.edtMeasure_1Exit(Sender: TObject);
var
   tmp:Extended;
begin
  if (Trim((Sender as TEdit).Text)<>'') and (TryStrToFloat(Trim((Sender as TEdit).Text),tmp)=False) then
  begin
    ShowMessage('输入的数据格式不对，请重新输入');
    (Sender as TEdit).SetFocus;
    Exit;
  end;
  (Sender as TEdit).Text:= FormatFloat('0.000',tmp);
end;

procedure TfrmMeasure.btnSaveClick(Sender: TObject);
var
  i:Integer;
begin
//  for i:=0 to Panel2.ControlCount-1 do
//  begin
//    if (Panel2.Controls[i] is TEdit) and (Trim((Panel2.Controls[i] as TEdit).Text)='') then
//    begin
//      (Panel2.Controls[i] as TEdit).Text:='0';
//    end;
//  end;
//
//  if status=1 then                                       //判断输入是否重复
//  begin
//    with DM.adoTmp do
//    begin
//      Close;
//      SQL.Clear;
//      SQL.Text:='select  rkey391, sr_no from data0392 where rkey391='+ DM.adoAuxrkey391.AsString +' and sr_no='+ Trim(edtCount.Text);
//      Open;
//      if not IsEmpty then
//      begin
//        ShowMessage('已经存在张次为'+ Trim(edtCount.Text)+'的测量记录，不能再添加' );
//        edtCount.SetFocus;
//        exit;
//      end;
//    end;
//  end;
//  try
//    with dm.adoTmp do
//    begin
//      Close;
//      SQL.Clear;
//      if status=1 then
//      begin
//        SQL.Text:='insert into data0392 values('+ DM.adoMainrkey.AsString + ',' + Trim(edtCount.Text) +','+ Trim(edtMeasure_1.Text) + ','+
//                  Trim(edtMeasure_2.Text)+','+ Trim(edtMeasure_3.Text)+','+ Trim(edtMeasure_4.Text)+','+ Trim(edtMeasure_5.Text)+','+
//                  Trim(edtMeasure_6.Text)+','+ Trim(edtMeasure_7.Text)+','+ Trim(edtMeasure_8.Text)+')';
//      end
//      else
//      begin
//        SQL.Text:='update data0392 set value_1='+ Trim(edtMeasure_1.Text) + ',value_2='+ Trim(edtMeasure_2.Text) + ',value_3='+ Trim(edtMeasure_3.Text)+
//             ',value_4='+ Trim(edtMeasure_4.Text)+ ',value_5='+ Trim(edtMeasure_5.Text)+ ',value_6='+ Trim(edtMeasure_6.Text)+
//                  ',value_7='+ Trim(edtMeasure_7.Text)+ ',value_8='+ Trim(edtMeasure_8.Text)+#13+
//                  'where rkey391='+ DM.adoAuxrkey391.AsString +' and sr_no='+ DM.adoAuxsr_no.AsString;
//      end;
//      ExecSQL;
//    end;
//    ModalResult:=mrYes;
//  except
//    on E: Exception do
//    begin
//      messagedlg(E.Message,mterror,[mbcancel],0);
//    end;
//  end;
end;

end.

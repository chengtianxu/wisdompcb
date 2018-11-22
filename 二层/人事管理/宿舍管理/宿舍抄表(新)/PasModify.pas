unit PasModify;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,MyClass, ComCtrls;

type
  TfrmModyfy = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtNo: TEdit;
    edtName: TEdit;
    cbbtype: TComboBox;
    edtCount: TEdit;
    dtpkDate: TDateTimePicker;
    Label6: TLabel;
    Memo1: TMemo;
    chkCheck: TCheckBox;
    btnSearch: TBitBtn;
    procedure btnSearchClick(Sender: TObject);
    procedure edtNoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtCountKeyPress(Sender: TObject; var Key: Char);
    procedure edtCountExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
     tmpsql:string;
     mc:TMyDataClass;
    { Private declarations }
  public
    status,irkey:Integer;
    { Public declarations }
  end;

var
  frmModyfy: TfrmModyfy;

implementation

uses DAMO,Pick_Item_Single,ConstVar,common;

{$R *.dfm}

procedure TfrmModyfy.btnSearchClick(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'r_code/房间编号/180,r_name/房间名称/250';
    InputVar.Sqlstr := 'select rkey,r_code,r_name from bedroommsg';
    Inputvar.KeyField:='';

    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtNo.Text:= frmPick_Item_Single.adsPick.fieldbyname('r_code').AsString;
      edtNo.Tag:=frmPick_Item_Single.adsPick.fieldbyname('rkey').AsInteger;
      edtName.Text:= frmPick_Item_Single.adsPick.fieldbyname('r_name').AsString;
    end;
    cbbtype.SetFocus;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmModyfy.edtNoExit(Sender: TObject);
begin
  if Trim(edtNo.Text)<>'' then
  begin
    tmpsql:='select rkey,r_code,r_name from bedroommsg where r_code='+ Trim(edtNo.Text);
    mc.OpenQuery(DM.adoTmp,tmpsql);
    if not DM.adoTmp.IsEmpty then
    begin
      edtNo.Tag:=DM.adoTmp.FieldByName('rkey').AsInteger;
      edtName.Text:= DM.adoTmp.FieldByName('r_name').AsString;
    end
    else
    begin
      ShowMessage('房间编号 '+ Trim(edtNo.Text) + ' 不存在，请重新输入');
      Exit;
    end;
  end;
end;

procedure TfrmModyfy.FormCreate(Sender: TObject);
begin
  mc:=TMyDataClass.Create(DM.ADOConnection1);
end;

procedure TfrmModyfy.edtCountKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9',#8,#46]) then Abort;
end;

procedure TfrmModyfy.edtCountExit(Sender: TObject);
var
  tmp:Double;
begin
  if Trim(edtCount.Text)='' then Exit;
  if not TryStrToFloat(Trim(edtCount.Text),tmp) then
  begin
    ShowMessage('抄表度数格式不对，请重新输入');
    edtCount.SetFocus;
    Exit;
  end
  else
    edtCount.Text:=FloatToStr(tmp);
end;

procedure TfrmModyfy.FormShow(Sender: TObject);
begin
  frmModyfy.Caption:='新增';
  if status=1 then dtpkDate.Date:= getsystem_date(dm.adoTmp,1);
  if (status=2) or (status=3) then
  begin
    frmModyfy.Caption:='编辑';
    edtNo.Text:= DM.adoMainR_code.AsString;
    edtNo.Tag:= DM.adoMainroomid.AsInteger;
    edtName.Text:= DM.adoMainR_name.AsString;
    if UpperCase(Trim(DM.adoMaintype.AsString))='E' then cbbtype.ItemIndex:=0
    else cbbtype.ItemIndex:=1;
    edtCount.Text:=DM.adoMainrecord_number.AsString;
    dtpkDate.Date:=DM.adoMainrecord_date.AsDateTime;
    chkCheck.Checked:=dm.adoMainischecked.AsBoolean;
    Memo1.Lines.Text:=DM.adoMainremark.AsString;
    edtNo.ReadOnly:=True;
    btnSearch.Enabled:=False;
    if status=3 then
    begin
      frmModyfy.Caption:='检查';
      btnSave.Enabled:=False;
      Panel2.Enabled:=False;
    end;
  end;


end;

procedure TfrmModyfy.btnSaveClick(Sender: TObject);
begin
  if Trim(edtNo.Text)='' then
  begin
    ShowMessage('房间编号不能为空');
    edtNo.SetFocus;
    Exit;
  end;
  if Trim(edtCount.Text)='' then
  begin
    ShowMessage('抄表度数不能为空');
    edtCount.SetFocus;
    Exit;
  end;
  if cbbtype.Text='' then
  begin
    ShowMessage('抄表类型不能为空');
    cbbtype.SetFocus;
    Exit;
  end;

  if status=1 then
  begin
    tmpsql:='insert Bedroom_equipment_record values('+ IntToStr(edtNo.Tag)+ ','+
          QuotedStr(FormatDateTime('yyyy-MM-dd',dtpkDate.Date))+','+ Trim(edtCount.Text)+','+
          QuotedStr(Copy(cbbtype.Items[cbbtype.itemindex],1,1))+','+ user_ptr+','+
          QuotedStr(FormatDateTime('yyyy-MM-dd HH:MM:SS',getsystem_date(DM.adoTmp,0)))+','+
          QuotedStr(Trim(Memo1.Lines.Text))+','+ QuotedStr(BoolToStr(chkCheck.Checked,True))+')';
    mc.ExecSql(tmpsql);
    tmpsql:='select rkey from Bedroom_equipment_record where roomid='+ IntToStr(edtNo.Tag)
          +' and record_date='+ QuotedStr(FormatDateTime('yyyy-MM-dd',dtpkDate.Date))+
          ' and type='+QuotedStr(Copy(cbbtype.Text,1,1));
    irkey:=mc.Get_Sql_Value(tmpsql);
  end;

  if status=2 then
  begin
    tmpsql:='update Bedroom_equipment_record set type='+ QuotedStr(Copy(cbbtype.Text,1,1))+
          ',record_number='+ Trim(edtCount.Text)+ ',record_date='+
          QuotedStr(FormatDateTime('yyyy-MM-dd',dtpkDate.Date))+',ischecked='+
          QuotedStr(BoolToStr(chkCheck.Checked,True))+',remark='+ QuotedStr(Trim(Memo1.Lines.Text))+
          ',operator='+ user_ptr+',oper_time='+
          QuotedStr(FormatDateTime('yyyy-MM-dd HH:MM:SS',getsystem_date(DM.adoTmp,0)))+#13+
          'from Bedroom_equipment_record where rkey='+ DM.adoMainrkey.AsString;
    mc.ExecSql(tmpsql);
  end;

  ModalResult:=mrYes;
end;

end.

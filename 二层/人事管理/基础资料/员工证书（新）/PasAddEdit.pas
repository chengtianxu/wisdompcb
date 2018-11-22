unit PasAddEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls,common,ADODB;

type
  TfrmAddEdit = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSave: TBitBtn;
    btnCancle: TBitBtn;
    lbCode: TLabel;
    edtCode: TEdit;
    lbName: TLabel;
    edtName: TEdit;
    chkMutiAdd: TCheckBox;
    lbNumber: TLabel;
    edtNumber: TEdit;
    lbCerName: TLabel;
    cbbName: TComboBox;
    lbType: TLabel;
    cbbType: TComboBox;
    lbStartDay: TLabel;
    dtpkStart: TDateTimePicker;
    dtpkEnd: TDateTimePicker;
    lbEnd: TLabel;
    lbRemark: TLabel;
    Memo1: TMemo;
    chkStatus: TCheckBox;
    btnCode: TBitBtn;
    Label1: TLabel;
    edtStation: TEdit;
    lbl1: TLabel;
    edtPosition: TEdit;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnCodeClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edtCodeExit(Sender: TObject);
    procedure edtCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtStationChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure fieldSave(adotmp:TADOQuery);
  public
    { Public declarations }
    state,rkey_ptr:Integer;
  end;

var
  frmAddEdit: TfrmAddEdit;

implementation

uses damo,Pick_Item_Single,ConstVar,DateUtils;

{$R *.dfm}

procedure TfrmAddEdit.FormShow(Sender: TObject);
var
  i:Integer;
begin
  edtName.Enabled:=False;
  with DM.adoTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select rkey,item from datadetail where dictid=18');
    Open;
    First;
   cbbName.items.Clear;
    while not Eof do
    begin
      cbbName.Items.AddObject(FieldByName('item').AsString,Pointer(FieldByName('rkey').AsInteger));
      Next;
    end;
  end;
  if state=1 then
  begin
    frmAddEdit.Caption:='新增';
    chkMutiAdd.Visible:=True;
    dtpkStart.Date:= getsystem_date(DM.adoTmp,1);
    dtpkEnd.Date:= IncDay(IncYear(getsystem_date(DM.adoTmp,1)),-1);
  end;
  if (state=2) or (state=3) then
  begin
    frmAddEdit.Caption:='编辑';
    btnCode.Enabled:=False;
    chkMutiAdd.Visible:=False;
    edtCode.Enabled:=False;
    edtName.Enabled:=False;
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select employeemsg.employeecode,employeemsg.rkey,employeemsg.chinesename,hrcertificate.code,datadetail.item, '
              + 'case when type=0 then ''个人'' else ''公司'' end as ctftype,hrcertificate.startdate,hrcertificate.type, '
              + 'hrcertificate.enddate,hrcertificate.status,stationid,datadetail_1.item as stations,hrcertificate.remark,PAbility '
              + 'from hrcertificate inner join employeemsg on hrcertificate.employeeid=employeemsg.rkey '
              + 'inner join datadetail on hrcertificate.datadetail_ptr=datadetail.rkey '
              + 'left join datadetail as datadetail_1 on hrcertificate.stationid=datadetail_1.rkey '
              + 'where hrcertificate.rkey = ' + IntToStr(rkey_ptr));
//      ShowMessage(SQL.Text);
      Open;
      edtCode.Text:= FieldByName('employeecode').AsString;
      edtName.Text:= FieldByName('chinesename').AsString;
      edtCode.Tag:= FieldByName('rkey').AsInteger;
      edtNumber.Text:= FieldByName('code').AsString;
      for i:= 0 to cbbName.Items.Count-1 do
        if FieldByName('item').AsString = cbbName.Items[i] then
        begin
          cbbName.ItemIndex:=i;
          Break;
        end;

//      if FieldByName('type').AsInteger=0 then cbbType.ItemIndex:=0
//      else if FieldByName('type').AsInteger=1 then  cbbType.ItemIndex:=1
//      else  cbbType.ItemIndex:=2;
      cbbType.ItemIndex:= FieldByName('type').AsInteger;

      dtpkStart.Date:= FieldByName('startdate').AsDateTime;
      dtpkEnd.Date:= FieldByName('enddate').AsDateTime;
      if FieldByName('status').AsInteger=1 then chkStatus.Checked:= True
      else chkStatus.Checked:= False;
      edtStation.Text:= FieldByName('PAbility').AsString;
      edtPosition.Text:= FieldByName('stations').AsString;
      edtPosition.Tag:=FieldByName('stationid').AsInteger;
      Memo1.Lines.Text:= FieldByName('remark').AsString;
    end;
    if state=3 then
    begin
      frmAddEdit.Caption:='检查';
      btnSave.Enabled:=False;
      Panel2.Enabled:=False;
    end;
  end;
end;

procedure TfrmAddEdit.btnCodeClick(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'employeecode/工号/150,chinesename/姓名/150';
    InputVar.Sqlstr := 'select rkey,employeecode,chinesename,multi_ability from employeemsg where status=1';
    Inputvar.KeyField:='';

    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtCode.Text:= frmPick_Item_Single.adsPick.fieldbyname('employeecode').AsString;
      edtCode.Tag:=frmPick_Item_Single.adsPick.fieldbyname('rKey').AsInteger;
      edtName.Text:= frmPick_Item_Single.adsPick.fieldbyname('chinesename').AsString;
      edtStation.Text:= frmPick_Item_Single.adsPick.fieldbyname('multi_ability').AsString;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmAddEdit.btnSaveClick(Sender: TObject);
begin
  if Trim(edtCode.Text)='' then
  begin
    ShowMessage('工号不能为空，请输入员工工号！');
    Abort;
  end;
  if Trim(edtCode.Text)='' then
  begin
    ShowMessage('证书编号不能为空，请重新输入！');
    Abort;
  end;
  if cbbName.Text='' then
  begin
    ShowMessage('证书名称不能为空，请重新输入！');
    Abort;
  end;
  if cbbType.Text='' then
  begin
    ShowMessage('证书性质不能为空，请重新输入！');
    Abort;
  end;
  if dtpkStart.Date>=dtpkEnd.Date then
  begin
    ShowMessage('证书生效日期不能大于等于失效日期，请重新输入！');
    Abort;
  end;

  try
    if state=1 then
    begin
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select rkey from hrcertificate where code = '+ QuotedStr(Trim(edtNumber.Text)) +' and employeeid = '+ IntToStr(edtCode.Tag));
        Open;
        if not IsEmpty then
        begin
          ShowMessage('工号:'+ Trim(edtCode.Text)+ ',证书编号:'+ Trim(edtNumber.Text)+' 的记录已经存在！');
          Exit;
        end;

        Close;
        SQL.Clear;
        SQL.Add('select code,datadetail_ptr,employeeid,[type],startdate,PAbility,enddate,inputdate,opration_person,[status],remark,stationid from hrcertificate where rkey=0');
        Open;
        Append;
        Self.fieldSave(DM.adoTmp);
        Post;
        UpdateBatch(arAll);
      end;
    end;
  
    if state=2 then
    begin
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select code,datadetail_ptr,employeeid,[type],PAbility,startdate,enddate,inputdate,opration_person,[status],remark,stationid from hrcertificate where rkey = ' + IntToStr(rkey_ptr));
        Open;
        if not IsEmpty then
        begin
          Edit;
          Self.fieldSave(DM.adoTmp);
          Post;
          UpdateBatch(arAll);
        end;
      end;
    end;
  except
    on E: Exception do
    begin
      messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
  if not chkMutiAdd.Checked then ModalResult:=mrOk
  else
  begin
    edtCode.Text:='';
    edtName.Text:='';
    edtNumber.Text:='';
    cbbName.ItemIndex:=-1;
    cbbType.ItemIndex:=-1;
    Memo1.Lines.Text:='';
  end;
end;

procedure TfrmAddEdit.fieldSave(adotmp:TADOQuery);
begin
  with adotmp do
  begin
    FieldByName('code').AsString:=edtNumber.Text;
    FieldByName('datadetail_ptr').AsInteger:= Integer(cbbName.Items.Objects[cbbName.ItemIndex]);
    FieldByName('employeeid').AsInteger:= edtCode.Tag;
    FieldByName('type').AsInteger:=cbbType.ItemIndex;
    FieldByName('startdate').AsDateTime:=StrToDate(FormatDateTime('yyyy-MM-dd',dtpkStart.DateTime));
    FieldByName('enddate').AsDateTime:=StrToDate(formatdatetime('yyyy-MM-dd',dtpkEnd.DateTime));
    FieldByName('inputdate').AsDateTime:= getsystem_date(DM.adoTime,0);   ;
    FieldByName('opration_person').AsInteger:= StrToInt(user_ptr);
    if chkStatus.Checked then FieldByName('status').AsInteger:= 1
    else FieldByName('status').AsInteger:=0;
    FieldByName('remark').AsString:=Memo1.Lines.Text;
   if edtPosition.Tag<>0 then
     FieldByName('stationid').AsInteger:=edtPosition.Tag;
   FieldByName('PAbility').AsString:=Trim(edtStation.Text);
  end;
end;

procedure TfrmAddEdit.edtCodeExit(Sender: TObject);
begin
  if Trim(edtCode.Text)<>'' then
  begin
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select rkey,employeecode,chinesename,multi_ability from employeemsg where status=1 and employeecode = ''' + Trim(edtCode.Text)+'''');
//      ShowMessage(SQL.Text);
      Open;
      if not IsEmpty then
      begin
        edtName.Text:= FieldByName('chinesename').AsString;
        edtCode.Tag:= FieldByName('rkey').AsInteger;
        edtStation.Text:= FieldByName('multi_ability').AsString;
      end
      else
      begin
        ShowMessage('你输入的员工工号有误，请重新输入！');
        edtCode.Text:='';
        edtCode.SetFocus;
      end;
    end;
  end;
end;



procedure TfrmAddEdit.edtCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Chr(Key)=#13 then
    edtNumber.SetFocus;
end;

procedure TfrmAddEdit.edtStationChange(Sender: TObject);
begin
  if edtStation.Text = '' then   edtStation.Tag:=0;
end;

procedure TfrmAddEdit.BitBtn1Click(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'item/岗位/400';
    InputVar.Sqlstr := 'select rkey,item from datadetail where dictid=16';
    Inputvar.KeyField:='';

    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtPosition.Text:= frmPick_Item_Single.adsPick.fieldbyname('item').AsString;
      edtPosition.Tag:=frmPick_Item_Single.adsPick.fieldbyname('rKey').AsInteger;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

end.

unit PasAddEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls,ADODB;

type
  TfrmAddEdit = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    lbType: TLabel;
    lbState: TLabel;
    lbNumber: TLabel;
    lbCode: TLabel;
    edtCode: TEdit;
    lbName: TLabel;
    edtName: TEdit;
    edtNumber: TEdit;
    lbBegin: TLabel;
    lbMin: TLabel;
    lbEnd: TLabel;
    btnSearch: TBitBtn;
    dtpkStart: TDateTimePicker;
    dtpkEnd: TDateTimePicker;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    cbbType: TComboBox;
    rgState: TRadioGroup;
    edtPro: TEdit;
    Label1: TLabel;
    Memo1: TMemo;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    procedure btnSearchClick(Sender: TObject);
    procedure edtCodeExit(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtProExit(Sender: TObject);
    procedure edtCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    birday:TDateTime;
    sex:Integer;
    procedure updatedb(adoTmp:TADOQuery);
    function IsOverAge(sex:Integer;day,birthday:TDateTime):Boolean;
    function GetEndDay(sex:Integer;birthday:TDateTime):TDateTime;
  public
    { Public declarations }
    ustate,selectRkey:Integer;
  end;

var
  frmAddEdit: TfrmAddEdit;

implementation

uses DAMO,common,Pick_Item_Single,ConstVar,DateUtils;

{$R *.dfm}


procedure TfrmAddEdit.FormShow(Sender: TObject);
var
  i:Integer;
begin
  with DM.adoTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select rkey,item from datadetail where dictid = 5');
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        cbbType.Items.AddObject(FieldByName('item').AsString,Pointer(FieldByName('rkey').AsInteger));
        Next;
      end;
    end;
  end;
  edtName.Enabled:=False;

  if (ustate=2) or (ustate=3) or (ustate=4) then
  begin
    if ustate=3 then
    begin
      Panel2.Enabled:=False;
      btnSave.Enabled:=False;
    end
    else
    begin
      edtCode.Enabled:=False;
      btnSearch.Enabled:=False;
      edtName.Enabled:=False;
    end;
    with DM.adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT  dbo.employee_contract.rkey, dbo.employee_contract.code, dbo.employee_contract.employeeid, dbo.employee_contract.startdate, '+
                     ' dbo.employee_contract.probationdate, dbo.employee_contract.enddate, dbo.employee_contract.type, dbo.employee_contract.opration_person, '+
                     ' dbo.employee_contract.status, dbo.employee_contract.remark, dbo.employee_contract.inputdate, dbo.v_employeemsg.employeecode, '+
                     ' dbo.v_employeemsg.chinesename, dbo.datadetail.item,v_employeemsg.birthday,v_employeemsg.sex '+
               ' FROM   dbo.employee_contract INNER JOIN dbo.v_employeemsg ON dbo.employee_contract.employeeid = dbo.v_employeemsg.rkey '+
               ' INNER JOIN dbo.datadetail ON dbo.employee_contract.type = dbo.datadetail.rkey '+
               ' where  dbo.employee_contract.rkey = '+ IntToStr(selectRkey));
      Open;
      edtCode.Text:= FieldByName('employeecode').AsString;
      edtCode.Tag:= FieldByName('employeeid').AsInteger;
//      ShowMessage(IntToStr(edtCode.Tag));
      edtName.Text:= FieldByName('chinesename').AsString;
      edtNumber.Text:= FieldByName('code').AsString;
      edtPro.Text:= FieldByName('probationdate').AsString;
      sex:= FieldByName('sex').AsInteger;
      birday:= FieldByName('birthday').AsDateTime;
      lbl2.Caption:= FieldByName('birthday').AsString;
      if (ustate=2) or (ustate=3) then
      begin
        dtpkStart.Date:= FieldByName('startdate').AsDateTime;
        dtpkEnd.Date:= FieldByName('enddate').AsDateTime;
      end;
      if ustate=4 then
      begin
        dtpkStart.Date:= IncDay(FieldByName('enddate').AsDateTime);
        if not IsOverAge(FieldByName('sex').AsInteger,IncYear(FieldByName('enddate').AsDateTime,3),FieldByName('birthday').AsDateTime) then
          dtpkEnd.Date:= IncYear(FieldByName('enddate').AsDateTime,3)
        else
        begin
//          dtpkEnd.Date:= GetEndDay(FieldByName('sex').AsInteger,FieldByName('birthday').AsDateTime) ;
          lbl1.Visible:= True;
        end;
      end;

      if (ustate=2) or (ustate=3)  then Memo1.Lines.Text:= FieldByName('remark').AsString
      else Memo1.Lines.Text:= FieldByName('remark').AsString + ' 原合同从：'+  FieldByName('startdate').AsString +' 到: '+ FieldByName('enddate').AsString + ' 结束 ';
      if FieldByName('status').AsInteger=1 then rgState.ItemIndex:=0
      else
      begin
        if ustate=4 then rgState.ItemIndex:=0
        else rgState.ItemIndex:=1;
      end;

      for i:=0 to cbbType.Items.Count-1 do
      begin
        if FieldByName('item').AsString = cbbType.Items[i] then
        begin
          cbbType.ItemIndex:=i;
          Break;
        end;
      end;
    end;
  end;
end;

procedure TfrmAddEdit.btnSearchClick(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'employeecode/工号/180,chinesename/姓名/250';
    InputVar.Sqlstr := 'select rkey,employeecode,chinesename,birthday,sex from employeemsg where status=1 ORDER by employeecode';
    Inputvar.KeyField:='';

    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtCode.Text:=frmPick_Item_Single.adsPick.fieldbyname('employeecode').AsString;
      edtName.Text:= frmPick_Item_Single.adsPick.fieldbyname('chinesename').AsString;
      edtCode.Tag:=frmPick_Item_Single.adsPick.fieldbyname('rKey').AsInteger;
      birday:= frmPick_Item_Single.adsPick.fieldbyname('birthday').AsDateTime;
      lbl2.Caption:= frmPick_Item_Single.adsPick.fieldbyname('birthday').asstring;
      sex:= frmPick_Item_Single.adsPick.fieldbyname('sex').AsInteger;
//      if ustate=1 then
//      begin
        dtpkStart.Date:= getsystem_date(DM.adoTime,1);
        edtPro.Text:= DateToStr(IncMonth(getsystem_date(dm.adoTime,1),3));
        if not IsOverAge(sex,IncDay(IncYear(dtpkStart.Date,3),-1),birday) then
          dtpkEnd.Date:= IncDay(IncYear(getsystem_date(DM.adoTime,1),3),-1)
        else
        begin
//          dtpkEnd.Date:= GetEndDay(sex,birday);
          lbl1.Visible:= True;
        end;
//      end;
    end;
  finally
    frmPick_Item_Single.Free;
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
      SQL.Add('select rkey,employeecode,chinesename from employeemsg where status=1 and employeecode = '+ QuotedStr(Trim(edtCode.Text)));
      Open;
      if IsEmpty then
      begin
        ShowMessage('工号不存在或者员工已经离职，请重新输入！');
        edtCode.SetFocus;
      end
      else
      begin
        edtName.Text:=FieldByName('chinesename').AsString;
        edtCode.tag:= FieldByName('rkey').AsInteger;
        edtNumber.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmAddEdit.btnSaveClick(Sender: TObject);
begin
  if Trim(edtCode.Text)='' then
  begin
    ShowMessage('工号不能为空');
    Exit;
  end;
  if IsOverAge(sex,dtpkEnd.Date,birday) then
  begin
     if MessageDlg('合同结束日期已过退休年龄，是否继续？',mtWarning,[mbYes,mbNo],0) <> mryes then Exit;
  end;
  if Trim(edtNumber.Text)='' then
  begin
    ShowMessage('合同编号不能为空');
    Exit;
  end
  else
  begin
    if (ustate=1) or (ustate=4) then
    begin
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select rkey from employee_contract where status=1 and employeeid = '+ IntToStr(edtCode.Tag));
        Open;
        if not IsEmpty then
        begin
          ShowMessage('此员工已经存在一条有效合同');
          exit;
        end;
        if ustate=1 then
        begin
          Close;
          SQL.Clear;
          SQL.Add('select rkey from employee_contract where code= '+ QuotedStr(Trim(edtNumber.Text)));
          Open;
          if not IsEmpty then
          begin
            ShowMessage('合同编号已经存在，请重新输入');
            exit;
          end;
        end;
      end;
    end;
  end;
  if cbbType.ItemIndex=-1 then
  begin
    ShowMessage('合同类型不能为空');
    Exit;
  end;
  if dtpkStart.Date > dtpkEnd.Date then
  begin
    ShowMessage('合同开始日期大于结束日期');
    Exit;
  end;

  if dtpkEnd.Date < getsystem_date(DM.adoTime,1) then
  begin
    if MessageDlg('合同结束日期小于当前日期，保存后合同为无效，是否保存当前合同？',mtWarning,[mbYes,mbNo],0)=mryes then rgState.ItemIndex:=1
    else Exit;
  end;

  try
//    DM.ADOConnection1.BeginTrans;
    if (ustate=1) or (ustate=4) then
    begin
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select rkey, code, employeeid, startdate, probationdate, enddate, type, '+
                ' inputdate, opration_person, status, remark from employee_contract where rkey is null');
        Open;
        Append;
        updatedb(DM.adoTmp);
        Post;
        UpdateBatch(arAll);
//        DM.ADOConnection1.CommitTrans;
        ModalResult:=mrYes;
      end;
    end;

    if (ustate=2)  then
    begin
      with DM.adoTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select rkey, code, employeeid, startdate, probationdate, enddate, type, '+
                ' inputdate, opration_person, status, remark from employee_contract where rkey = '+ IntToStr(selectRkey));
        Open;
        Edit;
        updatedb(DM.adoTmp);
        Post;
        UpdateBatch(arAll);
//        DM.ADOConnection1.CommitTrans;
        ModalResult:=mrYes;
      end;
    end;

  except
    on E: Exception do
    begin
//      DM.ADOConnection1.RollbackTrans;
      messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;

end;

procedure TfrmAddEdit.updatedb(adoTmp: TADOQuery);
begin
  with adoTmp do
  begin
    FieldByName('code').AsString:= Trim(edtNumber.Text);
    FieldByName('employeeid').AsInteger:= edtCode.Tag;
    FieldByName('startdate').AsDateTime:=dtpkStart.Date;
    if (Trim(edtPro.Text) <> '') then
    begin
      FieldByName('probationdate').AsDateTime:=StrToDate(edtPro.Text);
    end;
    FieldByName('enddate').AsDateTime:=dtpkEnd.Date;
//    ShowMessage('user_ptr:'+user_ptr+',cbbType.obj:'+IntToStr(Integer(cbbType.Items.Objects[cbbType.ItemIndex])));
    FieldByName('type').AsInteger:=Integer(cbbType.Items.Objects[cbbType.ItemIndex]);
    if rgState.ItemIndex=0 then  FieldByName('status').AsInteger:= 1
    else FieldByName('status').AsInteger:=2;
    FieldByName('inputdate').AsDateTime := getsystem_date(DM.adoTime,1);
    FieldByName('opration_person').AsInteger:= StrToInt(user_ptr);
    FieldByName('remark').AsString:=Trim(Memo1.Lines.Text);
  end;
end;


procedure TfrmAddEdit.edtProExit(Sender: TObject);
var
  date:TDateTime;
begin
  if Trim(edtPro.Text)<>'' then
  begin
    if not TryStrToDate(Trim(edtPro.Text),date) then
    begin
      ShowMessage('不是有效日期或日期格式不对！');
      edtPro.SetFocus;
      Exit;
    end;
  end;
end;

procedure TfrmAddEdit.edtCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=13 then edtNumber.SetFocus;
end;

function TfrmAddEdit.IsOverAge(sex:Integer;day, birthday: TDateTime): Boolean;
begin

  Result:= False;
//  strNow:= getsystem_date(DM.adoTime,1);
  if sex = 1 then
  begin
    if IncYear(birthday,60) <= day then Result := True;
  end
  else
  begin
    if IncYear(birthday,50) <= day then Result := True;
  end;
end;

function TfrmAddEdit.GetEndDay(sex:Integer;birthday: TDateTime): TDateTime;
begin
  if sex = 1 then
    Result:= IncDay(IncYear(birthday,60),-1)
  else
    Result:= IncDay(IncYear(birthday,55),-1)
end;

end.

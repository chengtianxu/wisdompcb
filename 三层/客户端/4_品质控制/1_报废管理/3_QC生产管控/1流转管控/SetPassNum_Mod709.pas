unit SetPassNum_Mod709;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Datasnap.DBClient,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, uBaseEditFrm,ucommfunc,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.XPMan, uBaseMainFrm,uBaseSinglePickListFrm,
  Vcl.Menus, Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit;

type
//  LgetRefreshClick=procedure (cds:TClientDataSet) of object;
  TfrmSetPassNum_Mod709 = class(TfrmBaseEdit)
    dspassNum: TDataSource;
    cdsPassNum: TClientDataSet;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
    edtNo: TEdit;
    Label4: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button1: TButton;
    cdsSave: TClientDataSet;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure edtNoKeyPress(Sender: TObject; var Key: Char);
    procedure edtNoExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    iItem:Integer;
    { Private declarations }
  public
    { Public declarations }
    FModelID:Integer;
    Lstrwhere:string;
    procedure GetData();
  end;

var
  frmSetPassNum_Mod709: TfrmSetPassNum_Mod709;

implementation

{$R *.dfm}

procedure TfrmSetPassNum_Mod709.BitBtn1Click(Sender: TObject);
var LFrm: TfrmSinglePickList;
begin
  LFrm := TfrmSinglePickList.Create(Self);
  try
    if (Trim(edtNo.Text)<>'') then
      LFrm.InitWithPickID(709,1, ' where Data0006.WORK_ORDER_NUMBER like ''%'+Trim(edtNo.Text)+'%''')
    else  LFrm.InitWithPickID(709,1);
    if LFrm.ShowModal = mrOk then
    begin
      edtNo.Tag:=LFrm.cdsPick.FieldByName('Rkey').AsInteger;
      edtNo.Text:=LFrm.cdsPick.FieldByName('WORK_ORDER_NUMBER').AsString;
      Edit2.SetFocus;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmSetPassNum_Mod709.BitBtn2Click(Sender: TObject);
var LFrm: TfrmSinglePickList;
begin
  LFrm := TfrmSinglePickList.Create(Self);
  try
    if (Trim(Edit1.Text)<>'') then
      LFrm.InitWithPickID(709,0, ' and DEPT_CODE like ''%'+Trim(Edit1.Text)+'%''')
    else  LFrm.InitWithPickID(709,0);
    if LFrm.ShowModal = mrOk then
    begin
      Edit1.Tag:=LFrm.cdsPick.FieldByName('Rkey').AsInteger;
      Edit1.Text:=LFrm.cdsPick.FieldByName('DEPT_CODE').AsString;
      Label3.Caption:=LFrm.cdsPick.FieldByName('DEPT_NAME').AsString;
      edtNo.SetFocus;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmSetPassNum_Mod709.Button1Click(Sender: TObject);
var LSQLPassNum,LsqlSave:string;
    Lcds,Lcdsave:TClientDataSet;
begin
  inherited;
  if (Trim(Edit1.Text)='') then
  begin
    ShowMessage('请选择对应工序。。');
    Edit1.SetFocus;
    Exit;
  end;
  if (Trim(edtNo.Text)='') then
  begin
    ShowMessage('请选择作业单。。');
    edtNo.SetFocus;
    Exit;
  end;
  if (Trim(Edit2.Text)='') then
  begin
    ShowMessage('请输入管控数值。。');
    Edit2.SetFocus;
    Exit;
  end;
  Lcds:=TClientDataSet.Create(Self);
  Lcdsave:=TClientDataSet.Create(Self);
  try
    LSQLPassNum:='select * from dbo.QC_PassNumCheck where Rkey06='+IntToStr(edtNo.Tag)+' and D34_ptr='+inttostr(Edit1.Tag);
    LsqlSave:='select * from dbo.QC_PassNumCheck where Rkey06='+IntToStr(edtNo.Tag)+' and D34_ptr='+inttostr(Edit1.Tag);
    if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSQLPassNum,LsqlSave]),[Lcds,Lcdsave]) then Exit;
    if Lcds.IsEmpty then  //不存在新增保存
    begin
      Lcdsave.Append;
      Lcdsave.FieldByName('Rkey06').Value:=edtNo.Tag;
      Lcdsave.FieldByName('D34_ptr').Value:=Edit1.Tag;
      Lcdsave.FieldByName('PassNum').Value:=StrToInt(Edit2.Text);
      Lcdsave.FieldByName('D05_ptr').Value:=gVar.rkey05;
      Lcdsave.FieldByName('InputDate').Value:=FormatDateTime('YYYY-MM-DD HH:mm:ss',gFunc.GetSvrDateTime);
      if RadioButton2.Checked then
        Lcdsave.FieldByName('Enable').Value:=1
      else
        Lcdsave.FieldByName('Enable').Value:=0;
      Lcdsave.Post;
      iItem:=1;
    end else //否则编辑保存
    begin
      if (MessageBox(Handle,'该工序该工单管控数值已设置,'+#13+'确定重新设置吗?','重新设置提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO)	then exit;
      Lcdsave.Edit;
      Lcdsave.FieldByName('PassNum').Value:=StrToInt(Edit2.Text);
      Lcdsave.FieldByName('D05_ptr').Value:=gVar.rkey05;
      Lcdsave.FieldByName('InputDate').Value:=FormatDateTime('YYYY-MM-DD HH:mm:ss',gFunc.GetSvrDateTime);
      if RadioButton2.Checked then
        Lcdsave.FieldByName('Enable').Value:=1
      else
        Lcdsave.FieldByName('Enable').Value:=0;
      Lcdsave.Post;
      iItem:=0;
    end;
    if (Lcdsave.ChangeCount>0) then
    if gSvrIntf.IntfPostDataByTable('QC_PassNumCheck',Lcdsave.delta) then
    begin
      if (Lcdsave.ChangeCount>0) then Lcdsave.MergeChangeLog;
      ShowMessage('保存成功');
      if (iItem=1) then Lstrwhere:=' AND QC_PassNumCheck.InputDate BETWEEN ' + QuotedStr(FormatDateTime('yyyy-MM-dd',gFunc.GetSvrDateTime-3)) + ' AND ' + QuotedStr(FormatDateTime('yyyy-MM-dd',gFunc.GetSvrDateTime+1));
      GetData;
      edtNo.Text:='';
      Edit2.Text:='';
      edtNo.SetFocus;
    end;
  finally
    Lcds.Free;
    Lcdsave.Free;
  end;
end;

procedure TfrmSetPassNum_Mod709.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  if not cdsPassNum.IsEmpty then
  begin
    Edit1.Tag:=cdsPassNum.FieldByName('D34_ptr').AsInteger;
    Edit1.Text:=cdsPassNum.FieldByName('DEPT_CODE').AsString;
    Label3.Caption:=cdsPassNum.FieldByName('DEPT_NAME').AsString;
    edtNo.Text:=cdsPassNum.FieldByName('WORK_ORDER_NUMBER').AsString;
    edtNo.Tag:=cdsPassNum.FieldByName('Rkey06').AsInteger;
    Edit2.Text:=cdsPassNum.FieldByName('PassNum').AsString;
    if (cdsPassNum.FieldByName('Enable').AsInteger=1) then RadioButton2.Checked:=True else RadioButton1.Checked:=True;
    iItem:=0;
  end;
end;

procedure TfrmSetPassNum_Mod709.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(Key,['0'..'9',#8,#13]) then Key:=#0;
  if (Key=#13) then
  begin
    Button1.SetFocus;
  end;
end;

procedure TfrmSetPassNum_Mod709.edtNoExit(Sender: TObject);
var LSQLd06:string;
    Lcds:TClientDataSet;
begin
  inherited;
  if (Trim(edtNo.Text)<>'') then
  begin
    Lcds:=TClientDataSet.Create(Self);
    try
      LSQLd06:='select data0006.RKEY,Data0006.WORK_ORDER_NUMBER from data0056 '
      +'inner join Data0006 on Data0056.WO_PTR=Data0006.RKEY where Data0006.WORK_ORDER_NUMBER like ''%'+Trim(edtNo.Text)+'%''';
      if not gSvrIntf.IntfGetDataBySql(LSQLd06,LCds) then Exit;
      if (not Lcds.IsEmpty) then
      begin
        edtNo.Text:=Lcds.FieldByName('WORK_ORDER_NUMBER').AsString;
        edtNo.Tag:=Lcds.FieldByName('Rkey').AsInteger;
      end else
      begin
        ShowMessage('查找不到该工单号，请再确定..');
        edtNo.SetFocus;
        Exit;
      end;
    finally
      Lcds.Free;
    end;
  end;
end;

procedure TfrmSetPassNum_Mod709.edtNoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key=#13) and (edtNo.Text<>'') then Edit2.SetFocus;
end;

procedure TfrmSetPassNum_Mod709.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:=caFree;
  frmSetPassNum_Mod709:=nil;
end;

procedure TfrmSetPassNum_Mod709.GetData;
var LSQLPassNum:string;
begin
  LSQLPassNum:='SELECT dbo.QC_PassNumCheck.*, dbo.Data0034.DEPT_CODE,Data0034.DEPT_NAME,'
              +'         dbo.Data0006.WORK_ORDER_NUMBER, dbo.Data0005.EMPLOYEE_NAME,'
              +'          case dbo.QC_PassNumCheck.Enable when 1 then ''有效'' else ''无效'' end as sEnable'
              +'  FROM  dbo.QC_PassNumCheck INNER JOIN '
              +'        dbo.Data0034 ON dbo.QC_PassNumCheck.D34_ptr = dbo.Data0034.RKEY INNER JOIN '
              +'        dbo.Data0006 ON dbo.QC_PassNumCheck.Rkey06 = dbo.Data0006.RKEY left JOIN '
              +'        dbo.Data0005 ON dbo.QC_PassNumCheck.D05_ptr = dbo.Data0005.RKEY '
              +' where 1=1 '+Lstrwhere
              +'  order by QC_PassNumCheck.rkey desc';
  gSvrintf.IntfGetDataBySql(LSQLPassNum,cdsPassNum);
end;

end.

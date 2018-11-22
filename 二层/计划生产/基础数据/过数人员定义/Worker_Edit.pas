unit Worker_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, Grids, DBGridEh, StdCtrls, Mask, DBCtrls,
  Menus,DB,AdoDB;

type
  TfrmWorker_Edit = class(TForm)
    Panel1: TPanel;
    btnSave: TSpeedButton;
    btnExit: TSpeedButton;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    SpeedButton1: TSpeedButton;
    DBText1: TDBText;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    edtPswd: TEdit;
    DBCheckBox1: TDBCheckBox;
    N3: TMenuItem;
    N4: TMenuItem;
    BitBtn4: TBitBtn;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBEdit3DblClick(Sender: TObject);
  private
    { Private declarations }
    function Check_Before_Post:boolean;//保存前的数据校验
  public
    { Public declarations }
    vEnterMode:byte;
    procedure Enter(rKey:integer;EnterMode:Byte);
  end;

var
  frmWorker_Edit: TfrmWorker_Edit;

implementation
uses dm,common,ConstVar,MyClass,Pick_WorkShop,Pick_Item_Single;
{$R *.dfm}

procedure TfrmWorker_Edit.Enter(rKey: integer; EnterMode: Byte);
begin

  with dmcon do begin
    aqEmployee.Close;
    aqEmployee.Open;
    aqDepartment.Close;
    aqDepartment.Open;
    vEnterMode:= EnterMode;
    Panel2.Enabled := EnterMode <> em_browse;
    DBGridEh1.Enabled :=Panel2.Enabled;
    if EnterMode= em_Add then
      begin
      MyDataClass.OpenDataSetByPara(NULL,adsWorker) ;
      adsWorker.Append;
      end
    else
      begin
      MyDataClass.OpenDataSetByPara(rKey,adsWorker);
      adsWorker.Edit;
      end;
    edtPswd.Text :=Base64_Decode(trim(adsWorker.fieldByName('LOGIN_PASS').AsString));
    btnSave.Enabled := EnterMode<>em_browse;
  end;
  ShowModal;
end;

procedure TfrmWorker_Edit.SpeedButton1Click(Sender: TObject);
var
  tmp:string;
begin
  tmp:= Pick_Employee(dmcon.adsWorker.fieldbyName('rkey').AsInteger,dmcon.ADOConnection1,1);
  if Tmp='' then exit;
  dmcon.adsWorker.edit;
  dmcon.adsWorker.FieldByName('Empl_ptr').Value := Tmp;
end;

procedure TfrmWorker_Edit.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmWorker_Edit.N1Click(Sender: TObject);
begin
  with TfrmPick_WorkShop.Create(Application)do
  try
    Enter(dmcon.adsWorkFlow.fieldByname('rKey').AsInteger);
    if ShowModal = mrok then
    begin
      with dmcon do begin
        cdsPickWorkShop.First;
        while not cdsPickWorkShop.Eof do begin
          if cdsPickWorkShop.FieldByName('IsSelected').AsBoolean then
          if not adsWorkFlow.Locate('Dept_ptr',cdsPickWorkShop.fieldbyName('rKey').AsInteger,[]) then
          begin
            adsWorkFlow.Append;
            adsWorkFlow.FieldByName('Dept_ptr').Value := cdsPickWorkShop.fieldbyName('rKey').AsInteger;
            adsWorkFlow.Post;
          end;
          cdsPickWorkShop.next;
        end;
      end;
    end;
  finally
    release;
  end;
end;

procedure TfrmWorker_Edit.btnSaveClick(Sender: TObject);
var
  rKey:integer;
begin
  if not Check_Before_Post then exit;
  with dmcon do begin
    try
      if not ADOConnection1.InTransaction then
        ADOConnection1.BeginTrans;
      adsWorker.edit;  
      adsWorker.fieldByName('LOGIN_PASS').AsString :=Base64_Encode(trim(edtPswd.Text));
      adsWorker.Post;
      adsWorker.UpdateBatch(arAll);
      rKey:=adsWorker.FieldbyName('rKey').AsInteger;
      MyDataClass.UpdateValueToField(adsWorkFlow,rKey,'User_ptr');
      adsWorkFlow.UpdateBatch(ArAll);
      ADOConnection1.CommitTrans;
      adsWorkerList.Close;
      adsWorkerList.open;
      adsWorkerList.Locate('rKey',rKey,[]);
    except
      ADOConnection1.RollbackTrans;
      ShowMsg('保存数据失败!',1);
    end;
  end;
  close;
end;

function TfrmWorker_Edit.Check_Before_Post: boolean;
begin
  result := true;
  if trim(DBEdit1.Text)='' then
  begin
    ShowMsg('登录名称不能为空',1);
    result := false;
    exit;
  end;
  if vEnterMode = em_add then
  if not MyDataClass.Check_Unique_Field_Value('select 1 from data0486 where LOGIN_NAME='+QuotedStr(trim(DBEdit1.Text))) then
  begin
    ShowMsg('当前用户名已经存在，请重新输入',1);
    abort;
  end;
  if trim(DBEdit2.Text)='' then
  begin
    ShowMsg('员工代码不能为空',1);
    result := false;
    exit;
  end;
  if trim(edtPswd.Text)='' then
  begin
    ShowMsg('密码不能为空',1);
    result := false;
    exit;
  end;
  if dmcon.adsWorkFlow.IsEmpty then
  begin
    ShowMsg('工序不能为空',1);
    result := false;
    exit;
  end;
end;

procedure TfrmWorker_Edit.N2Click(Sender: TObject);
begin
  if not dmcon.adsWorkFlow.IsEmpty then
  dmcon.adsWorkFlow.Delete;
end;

procedure TfrmWorker_Edit.N3Click(Sender: TObject);
begin
  dmcon.adsWorkFlow.First ;
  while not dmcon.adsWorkFlow.Eof do
      if not dmcon.adsWorkFlow.IsEmpty then
          dmcon.adsWorkFlow.Delete;
end;

procedure TfrmWorker_Edit.BitBtn4Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case Tcomponent(Sender).Tag of
    1:
    begin
      InputVar.Fields := 'warehouse_code/工厂编号/100,warehouse_name/工厂名称/200,abbr_name/工厂简称/200';
      InputVar.Sqlstr :='select rkey,warehouse_code,warehouse_name,warehouse_type,abbr_name from data0015';
      inputvar.KeyField:='warehouse_code';
    end;

  end;
  InputVar.AdoConn := dmcon.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case Tcomponent(Sender).Tag of
     1:begin
         with dmcon. adsWorker do
         begin
           if not (State in [dsInsert,dsEdit])then
             Edit;
           FieldByName('warehouse_ptr').Value   :=
                      trim(frmPick_Item_Single.adsPick.FieldValues['rkey']);
         end
//         label5.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['warehouse_name']);
//         EdtFac.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
//         FsWare_type:=frmPick_Item_Single.adsPick.Fieldbyname('warehouse_type').AsString;
//         MEdtReqNo.Text:=getReqNo(FsWare_type, Pr_id);
//         whs_ptr:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').asstring;
       end;
    end;
  end ;
 finally
   frmPick_Item_Single.Free ;
 end;
end;

procedure TfrmWorker_Edit.FormCreate(Sender: TObject);
begin
  with dmcon.Read0015 do
  begin
    if Active =False then
    Open;
  end
end;

procedure TfrmWorker_Edit.DBEdit3DblClick(Sender: TObject);
begin
  with dmcon.adsWorker do
  begin
    if (State in [dsInsert,dsEdit])=False then
      Edit;

    FieldByName('warehouse_ptr').Value:=null;
  end;
end;

end.

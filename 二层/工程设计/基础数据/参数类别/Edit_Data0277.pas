unit Edit_Data0277;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,db;

type
  TfrmEdit_Data0277 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    rgStatus: TRadioGroup;
    Label3: TLabel;
    edtName: TEdit;
    edtDesc: TEdit;
    btnSave: TButton;
    btnCancel: TButton;
    procedure btnSaveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    Run_Mode:byte;//进入模式 1。浏览，2。新增，3。编辑
    procedure Set_Run_Mode;//设置窗体各编辑框的模式的
    function Check_Unique_Value(KeyValue:string):boolean; //验证类别名称是否已经存在数据表中,true，不存在，false存在
  public
    { Public declarations }
   //入口函数，enter_mode进入模式 1。浏览，2。新增，3。编辑
    procedure Enter(EnterMode:byte);
end;

var
  frmEdit_Data0277: TfrmEdit_Data0277;

implementation
uses common,constVar,Main_Data095,MyClass;
{$R *.dfm}

{ TfrmEdit_Data0277 }

procedure TfrmEdit_Data0277.Enter(EnterMode: byte);
begin
//  ads_Tmp.Locate(,FieldValue,[loCaseInsensitive ]);//查找的记录数值必须完全匹配
  //直接从数据表中获取数据
  Run_Mode:= EnterMode;
  if Run_Mode <> em_Add then
  begin
    edtName.Text := Is_Null(frmMain_Data095.adsMaster.fieldbyName('CATEGORY_NAME').AsString,'');
    edtDesc.Text := Is_Null(frmMain_Data095.adsMaster.fieldbyName('CATEGORY_DESC').AsString,'');
    rgStatus.ItemIndex:= Is_Null(frmMain_Data095.adsMaster.fieldbyName('STATUS').AsInteger,1)-1;
  end;
  Set_Run_Mode;
  Showmodal;
end;

procedure TfrmEdit_Data0277.btnSaveClick(Sender: TObject);
begin
  inherited;
  if Run_Mode = em_Add then //如果是新增记录，那么就要验证类别是否重复
    if not Check_Unique_Value(trim(edtName.Text)) then abort;
  with frmMain_Data095 do begin
    if run_Mode = em_Add then //新增
      adsMaster.Append
    else  if run_Mode = em_Edit then //编辑
    begin
      adsMaster.Locate('CATEGORY_NAME',trim(edtName.Text),[loCaseInsensitive]);//查找的记录数值必须完全匹配
      adsMaster.Edit;
    end;
//数据赋值
    adsMaster.FieldByName('CATEGORY_NAME').Value := edtName.Text;
    adsMaster.FieldByName('CATEGORY_DESC').Value := edtDesc.Text;
    adsMaster.fieldbyName('STATUS').AsInteger := rgStatus.ItemIndex +1;
    adsMaster.Post;
    if not MyDataClass.SaveData(adsMaster,true) then
    begin
      ShowMsg('保存数据失败，请检查!','警告',1);
      abort;
    end;
  end;
  close;
end;

procedure TfrmEdit_Data0277.Set_Run_Mode;
begin
  btnSave.Enabled := Run_Mode <> em_Browse;
  edtName.readonly := not btnSave.Enabled;
  edtDesc.readonly := not btnSave.Enabled;
  rgStatus.Enabled := btnSave.Enabled;
end;

function TfrmEdit_Data0277.Check_Unique_Value(KeyValue:string): boolean;
var
  Sqlstr:string;
begin
  if KeyValue = '' then //空值不能通过验证
  begin
    ShowMsg('类别名称不能为空，请检查!','警告',1);
    result := false;
  end
  else
  begin
    Sqlstr:='select * from data0277 where CATEGORY_NAME='+QuotedStr(KeyValue);
    result := not MyDataClass.IsExists(sqlstr);
//    result := adsMaster.aqTmp.IsEmpty;
    if not result then
      ShowMsg('该类别已经存在，不能再录入，请检查!','警告',1);
  end;
end;

procedure TfrmEdit_Data0277.FormActivate(Sender: TObject);
begin
  inherited;
  edtName.SetFocus;
end;

end.

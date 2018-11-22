unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGridEh, Menus;

type
  Tfrm_main = class(TForm)
    Panel1: TPanel;
    BtnClose: TBitBtn;
    BtnRefresh: TBitBtn;
    BtnExportToExcel: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    DBGridEh1: TDBGridEh;
    Splitter1: TSplitter;
    DBGridEh2: TDBGridEh;
    BitBtn14: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure BtnExportToExcelClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    PreColumn:TColumnEh;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_main: Tfrm_main;

implementation

uses damo,common,DB, MaintenanceCycleSetting, MaintenanceCycle;

{$R *.dfm}

procedure Tfrm_main.FormCreate(Sender: TObject);
begin
  if not app_init_2(dm.ADOConnection1) then
  begin
    showmsg('程序启动失败,请与管理员联系!',1);
    application.Terminate;
  end;
  self.Caption:=application.Title;
//  rkey73:='851';
//  user_ptr := '963';
//  vprev := '4';
end;

procedure Tfrm_main.FormShow(Sender: TObject);
begin
  PreColumn := DBGridEh1.Columns[0];
  DM.ADS811.Open;


  DM.ADS812.Open;
end;

procedure Tfrm_main.BtnCloseClick(Sender: TObject);
begin
  application.Terminate;
end;

procedure Tfrm_main.BtnRefreshClick(Sender: TObject);
var
  rkey811:string;
begin
  rkey811 := dm.ADS811DeviType.Value;
  dm.ADS811.Close;
  dm.ADS811.Prepared;
  dm.ADS811.Open;
  if rkey811 <> '' then
  dm.ADS811.Locate('DeviType',rkey811,[]);
end;

procedure Tfrm_main.BtnExportToExcelClick(Sender: TObject);
begin
  if not dm.ADS811.IsEmpty then
  if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure Tfrm_main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssalt in Shift) then
  ShowMessage(DM.ADS811.CommandText);
end;

procedure Tfrm_main.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Char(Key)='V') and (ssalt in Shift) then
  ShowMessage(DM.ADS812.CommandText);
end;

procedure Tfrm_main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if (Column.Title.SortMarker=smDownEh) or (Column.Title.SortMarker=smNoneEh) then
  begin
    Column.Title.SortMarker := smUpEh;
    DM.ADS811.IndexFieldNames := Column.FieldName;
  end
  else
  begin
    Column.Title.SortMarker := smDownEh;
    DM.ADS811.IndexFieldNames := Column.FieldName + ' DESC';
  end;

  if (PreColumn.FieldName <> Column.FieldName) and (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    Label1.Caption := Column.Title.Caption;
    Edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clRed;
    PreColumn := Column;
  end
  else
  begin
    Edit1.SetFocus;
  end;
end;

procedure Tfrm_main.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text) <> '' then
  begin
    DBGridEh1.DataSource.DataSet.Filter := PreColumn.FieldName + ' like ''%'+ Trim(Edit1.Text)+'%''';
  end
  else
  begin
    DBGridEh1.DataSource.DataSet.Filter := '';
  end;
end;

procedure Tfrm_main.BitBtn14Click(Sender: TObject);
begin
  Frm_MaintenanceCycleSetting:=TFrm_MaintenanceCycleSetting.Create(Application);
  Frm_MaintenanceCycleSetting.ShowModal;
end;

procedure Tfrm_main.N1Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  try
    Frm_MaintenanceCycle:=TFrm_MaintenanceCycle.Create(Application);
    Frm_MaintenanceCycle.v_status:=0;  //新增
    if Frm_MaintenanceCycle.ShowModal=mrok then
    begin
     dm.ADS811.Close;
     dm.ADS811.Open;
     dm.ADS811.Locate('DeviType',Frm_MaintenanceCycle.rkey811,[]);
     ShowMsg('新增操作成功!',1);
    end;
  finally
    Frm_MaintenanceCycle.Free;
  end;
end;

procedure Tfrm_main.N2Click(Sender: TObject);
begin
  if (strtoint(vprev)=1)  then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  try
    Frm_MaintenanceCycle:=TFrm_MaintenanceCycle.Create(Application);
//    Frm_MaintenanceCycle.rkey811:=dm.ADS811DeviType.Value;
    Frm_MaintenanceCycle.v_status:=1;     //编辑
    if Frm_MaintenanceCycle.ShowModal=mrok then
    begin

      BtnRefreshClick(Sender);
      ShowMsg('编辑操作成功!',1);
    end;
  finally
    Frm_MaintenanceCycle.Free;
  end;
end;

procedure Tfrm_main.N3Click(Sender: TObject);
begin
  if (strtoint(vprev)=1)  then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  try
    Frm_MaintenanceCycle:=TFrm_MaintenanceCycle.Create(application);
    Frm_MaintenanceCycle.v_status:= 2; //表示复制
    if Frm_MaintenanceCycle.ShowModal = mrok then
    begin
      dm.ADS811.Close;
      dm.ADS811.Open;
      dm.ADS811.Locate('DeviType',Frm_MaintenanceCycle.rkey811,[]);
      ShowMsg('复制操作成功!',1);
    end;
  finally
    Frm_MaintenanceCycle.Free;
  end;
end;

procedure Tfrm_main.N4Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  if MessageDlg('您确删除该保养类型吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  begin
    try
      DM.ADOConnection1.BeginTrans;
      with dm.ADOQuery1 do
      begin
        Close;
        SQL.Text := 'delete data0812 where Devitype ='+ quotedstr(DM.ADS811DeviType.Value);
        ExecSQL;
        close;
        sql.Text := 'delete data0811 where DeviType='+quotedstr(DM.ADS811DeviType.Value) ;

        if ExecSQL>0 then
        begin

         self.BtnRefreshClick(Sender);
        end;
      end;
      DM.ADOConnection1.CommitTrans;
      common.ShowMsg('删除操作成功！',1);
    except
      on E: Exception do
      begin
        DM.ADOConnection1.RollbackTrans;
        ShowMessage('可能是这个保养类型在设备代码定义中的保养类型中有定义，请先取消该设备保养类型在设备代码中的定义');
//        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  end;
end;

end.

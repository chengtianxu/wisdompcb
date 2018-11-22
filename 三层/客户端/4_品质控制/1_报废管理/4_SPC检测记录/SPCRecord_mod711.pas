unit SPCRecord_mod711;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseMainFrm,ucommfunc,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB,
  Vcl.XPMan, Vcl.Menus, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, PasSPCText_mod711;

type
  TfrmSPCRecord_mod711 = class(TfrmBaseMain)
    dsQC_Dep: TDataSource;
    cdsQC_Dep: TClientDataSet;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    Splitter1: TSplitter;
    DBGridEh2: TDBGridEh;
    cdsDetail: TClientDataSet;
    dsDetail: TDataSource;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure cdsMainAfterScroll(DataSet: TDataSet);
    procedure pmMainPopup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    FDisplayFrm2: TfrmSPCText_mod711;
    { Public declarations }
    procedure GetData();override;
    procedure getRefreshClick(cds:TClientDataSet);
  end;

var
  frmSPCRecord_mod711: TfrmSPCRecord_mod711;

implementation

{$R *.dfm}

{ TfrmSPCRecord_mod711 }

procedure TfrmSPCRecord_mod711.cdsMainAfterScroll(DataSet: TDataSet);
var
  lsql:string;
begin
  inherited;
  if (ehMain.DataSource.DataSet.IsEmpty) then
  begin
    cdsDetail.Active:=False;
  end;
  lsql:='SELECT * FROM  dbo.SPC_DevInfo_Detail '
       +'where SPC_DevInfo_Detail.Parent_IDkey='''+Dataset.FieldByName('IDKey').AsString+'''';
  gSvrintf.IntfGetDataBySql(lsql,cdsDetail);
end;

procedure TfrmSPCRecord_mod711.GetData;
var LSQLstr:string;
begin
  LSQLstr:='select * from dbo.QC_DeptBugDef where ID is NULL';
  gSvrintf.IntfGetDataBySql(LSQLstr,cdsQC_Dep);
  FMainFrmSql :=cdsMain.CommandText;
  if FMainWhere.Trim = '' then
    FMainWhere := ' AND SPC_DevInfo_Main.Input_DateTime BETWEEN ' + QuotedStr(FormatDateTime('yyyy-MM-dd',gFunc.GetSvrDateTime-3)) + ' AND ' + QuotedStr(FormatDateTime('yyyy-MM-dd',gFunc.GetSvrDateTime+1));
  FOrderby := ' order by SPC_DevInfo_Main.rkey desc';
  inherited;
  cdsQC_Dep.Append;
  cdsQC_Dep.FieldByName('ID').Value:=1;
  cdsQC_Dep.FieldByName('TypeName').Value:='SPC检测';
  cdsQC_Dep.FieldByName('TypeDesc').Value:='SPC检测记录';
  cdsQC_Dep.Post;
end;

procedure TfrmSPCRecord_mod711.getRefreshClick(cds: TClientDataSet);
begin
  btnRefreshClick(nil);
end;

procedure TfrmSPCRecord_mod711.N1Click(Sender: TObject);
begin
  inherited;
  if frmSPCText_mod711 = nil then
  begin
    frmSPCText_mod711 := TfrmSPCText_mod711.Create(Self);
    frmSPCText_mod711.refresh:= self.getRefreshClick;
  end;
  frmSPCText_mod711.GetData('0');
  frmSPCText_mod711.inti;
  frmSPCText_mod711.iType:=0;
  frmSPCText_mod711.dtpReqDate.DateTime:=gFunc.GetSvrDateTime;
  frmSPCText_mod711.DateTimePicker1.DateTime:=gFunc.GetSvrDateTime;
  frmSPCText_mod711.Show;
end;

procedure TfrmSPCRecord_mod711.N2Click(Sender: TObject);
var iRow:Integer;
begin
  inherited;
  if frmSPCText_mod711 = nil then
  begin
    frmSPCText_mod711 := TfrmSPCText_mod711.Create(Self);
    frmSPCText_mod711.refresh:= self.getRefreshClick;
  end;
  frmSPCText_mod711.GetData(cdsMain.FieldByName('IDKey').AsString);
  frmSPCText_mod711.inti;
  frmSPCText_mod711.iType:=1; //编辑
  frmSPCText_mod711.dtpReqDate.DateTime:=gFunc.GetSvrDateTime;
  frmSPCText_mod711.DateTimePicker1.DateTime:=gFunc.GetSvrDateTime;
  frmSPCText_mod711.Edit1.Text:=Trim(cdsMain.FieldByName('bigProcessNode').AsString);
  frmSPCText_mod711.Edit2.Text:=Trim(cdsMain.FieldByName('smallProcessNode').AsString);
  frmSPCText_mod711.Edit3.Text:=Trim(cdsMain.FieldByName('equipmentNode').AsString);
  frmSPCText_mod711.Edit1.ReadOnly:=True;
  frmSPCText_mod711.Edit2.ReadOnly:=True;
  frmSPCText_mod711.Edit3.ReadOnly:=True;
  frmSPCText_mod711.BitBtn2.Enabled:=False;
  if not cdsDetail.IsEmpty then
  begin
    iRow:=1;
    cdsDetail.First;
    while not cdsDetail.Eof do
    begin
      frmSPCText_mod711.SGrid1.RowCount:=frmSPCText_mod711.SGrid1.RowCount+1;
      frmSPCText_mod711.SGrid1.Cells[frmSPCText_mod711.str_list.IndexOfName('测试项目'),iRow]:=cdsDetail.FieldByName('testItemName').AsString;
      frmSPCText_mod711.SGrid1.Cells[frmSPCText_mod711.str_list.IndexOfName('分析频率'),iRow]:=cdsDetail.FieldByName('frequency').AsString;
      frmSPCText_mod711.SGrid1.Cells[frmSPCText_mod711.str_list.IndexOfName('控制目标'),iRow]:=cdsDetail.FieldByName('controlTarget').AsString;
      frmSPCText_mod711.SGrid1.Cells[frmSPCText_mod711.str_list.IndexOfName('控制下限'),iRow]:=cdsDetail.FieldByName('controlLowerLimit').AsString;
      frmSPCText_mod711.SGrid1.Cells[frmSPCText_mod711.str_list.IndexOfName('控制上限'),iRow]:=cdsDetail.FieldByName('controlUpperLimit').AsString;
      frmSPCText_mod711.SGrid1.Cells[frmSPCText_mod711.str_list.IndexOfName('测试单位'),iRow]:=cdsDetail.FieldByName('testUnit').AsString;
      frmSPCText_mod711.SGrid1.Cells[frmSPCText_mod711.str_list.IndexOfName('测试结果'),iRow]:=cdsDetail.FieldByName('testResult').AsString;
      frmSPCText_mod711.SGrid1.Cells[frmSPCText_mod711.str_list.IndexOfName('添加量'),iRow]:=cdsDetail.FieldByName('additiveContent').AsString;
      frmSPCText_mod711.SGrid1.Cells[frmSPCText_mod711.str_list.IndexOfName('复测结果'),iRow]:=cdsDetail.FieldByName('reviewResult').AsString;
      iRow:=iRow+1;
      cdsDetail.Next;
    end;
    frmSPCText_mod711.SGrid1.RowCount:=frmSPCText_mod711.SGrid1.RowCount-1;
  end;
  frmSPCText_mod711.Show;
end;

procedure TfrmSPCRecord_mod711.N3Click(Sender: TObject);
var sSQL:string;
    Lcds:TClientDataSet;
begin
  inherited;
  if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
  begin
    Lcds:=TClientDataSet.Create(Self);
    try
      sSQL:='select * from SPC_DevInfo_Main where Rkey='+cdsMain.FieldByName('Rkey').AsString;
      gSvrintf.IntfGetDataBySql(sSQL,Lcds);
      if not Lcds.IsEmpty then
      begin
        Lcds.Delete;
      end;
      if (Lcds.ChangeCount>0) then
      if gSvrIntf.IntfPostDataByTable('SPC_DevInfo_Main',Lcds.delta) then
      begin
        Lcds.MergeChangeLog;
        btnRefreshClick(nil);
      end;
    finally
      Lcds.Free;
    end;
  end;
end;

procedure TfrmSPCRecord_mod711.pmMainPopup(Sender: TObject);
begin
  inherited;
  if cdsMain.IsEmpty then
  begin
    N1.Enabled:=True;
    N2.Enabled:=False;
    N3.Enabled:=False;
  end else
  begin
    N1.Enabled:=True;
    N2.Enabled:=True;
    N3.Enabled:=True;
  end;
end;

end.

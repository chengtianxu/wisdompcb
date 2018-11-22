unit PasSetLocat_Mod33;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseEditFrm,ucommfunc,uBaseSinglePickListFrm,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Data.DB, Datasnap.DBClient, Vcl.Menus;

type
  TfrmSetLocat_Mod33 = class(TfrmBaseEdit)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    Label5: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    BitBtn3: TBitBtn;
    cds176: TClientDataSet;
    ds176: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure BitBtn3Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure getdata();
  end;

var
  frmSetLocat_Mod33: TfrmSetLocat_Mod33;

implementation

{$R *.dfm}

procedure TfrmSetLocat_Mod33.BitBtn3Click(Sender: TObject);
var LFrm: TfrmSinglePickList;
begin
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(33,4,' where data0016.location_type=0');
    if LFrm.ShowModal = mrOk then
    begin
      Edit1.Text:=LFrm.cdsPick.FieldByName('code').AsString;
      Edit1.Tag:=LFrm.cdsPick.FieldByName('rkey').Value;
      Edit2.Text:=LFrm.cdsPick.FieldByName('LOCATION').AsString;
      Edit3.Text:=LFrm.cdsPick.FieldByName('abbr_name').AsString;
      Edit4.Text:=LFrm.cdsPick.FieldByName('stype').AsString;
      Edit5.Text:='';
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmSetLocat_Mod33.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmSetLocat_Mod33.btnSaveClick(Sender: TObject);
var Lcds:TClientDataSet;
begin
  inherited;
  Lcds:=TClientDataSet.Create(Self);
  try
    gSvrIntf.IntfGetDataBySql('select * from data0176 where rkey_16= ' + IntToStr(Edit1.Tag)+' and location='''+Trim(Edit5.Text)+'''',Lcds);
    if not Lcds.IsEmpty then
    begin
      ShowMessage('该仓库已定义详细位置,是否重新定义?');
      Edit5.SetFocus;
      Exit;
    end else
    begin
      Lcds.Append;
      Lcds.FieldByName('location').Value:=Trim(Edit5.Text); //详细位置
      Lcds.FieldByName('rkey_16').Value:=Edit1.Tag; //16Rkey
      Lcds.Post;
    end;
    if (Lcds.ChangeCount>0) then
    if gSvrIntf.IntfPostDataByTable('data0176',Lcds.delta) then
    begin
      Lcds.MergeChangeLog;
      ShowMessage('保存成功');
      getdata;
      Edit1.Text:='';
      Edit2.Text:='';
      Edit3.Text:='';
      Edit4.Text:='';
      Edit5.Text:='';
    end;
  finally
    Lcds.Free;
  end;
end;

procedure TfrmSetLocat_Mod33.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  if not cds176.IsEmpty then
  begin
    Edit1.Text:=cds176.FieldByName('code').AsString;
    Edit1.Tag:=cds176.FieldByName('rkey').Value;
    Edit2.Text:=cds176.FieldByName('LOCATION2').AsString;
    Edit3.Text:=cds176.FieldByName('abbr_name').AsString;
    Edit4.Text:=cds176.FieldByName('stype').AsString;
    Edit5.Text:=cds176.FieldByName('location').AsString;
  end;
end;

procedure TfrmSetLocat_Mod33.getdata;
var LSQL:string;
begin
  lSQL := 'select DATA0176.*,Data0016.CODE,Data0016.LOCATION as LOCATION2,Data0016.LOCATION_TYPE,'
         +'  case data0016.location_type when 0 then ''材料仓'' when 1 then ''成品仓'' end as stype,'
         +'   dbo.data0015.warehouse_code,dbo.data0015.warehouse_name,dbo.data0015.abbr_name'
         +'   from DATA0176 inner join Data0016 on DATA0176.rkey_16=Data0016.RKEY'
         +'   inner join Data0015 on dbo.data0016.whouse_ptr=dbo.data0015.rkey';
  gSvrIntf.IntfGetDataBySql(lSQL,cds176);
end;

procedure TfrmSetLocat_Mod33.N1Click(Sender: TObject);
var Lcds:TClientDataSet;
begin
  inherited;
  if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
  begin
    Lcds:=TClientDataSet.Create(Self);
    try
      gSvrIntf.IntfGetDataBySql('select * from data0176 where rkey= ' + cds176.FieldByName('Rkey').AsString+'',Lcds);
      if not Lcds.IsEmpty then Lcds.Delete;
      if (Lcds.ChangeCount>0) then
      if gSvrIntf.IntfPostDataByTable('data0176',Lcds.delta) then
      begin
        Lcds.MergeChangeLog;
        ShowMessage('删除成功！');
        getdata;
      end;
    finally
      Lcds.Free;
    end;
  end;
end;

end.

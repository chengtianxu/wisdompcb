unit Unusual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Menus, DB;

type
  TFrm_Unusual = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    DBGrid2: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Unusual: TFrm_Unusual;

implementation

uses Demo, UnDetail,common;

{$R *.dfm}

procedure TFrm_Unusual.BitBtn1Click(Sender: TObject);
begin
Close;
end;

procedure TFrm_Unusual.N1Click(Sender: TObject);
begin
try
 Frm_UnDetail:=TFrm_UnDetail.Create(application);
 Frm_UnDetail.State:=0; //新增
  if Frm_UnDetail.ShowModal=mrok then
  begin
    dm.ADO257.Close;
    dm.ADO257.Prepared;
    dm.ADO257.Open;
    dm.ADO257.Locate('v_ttype',dm.aq257v_ttype.Value,[]);
    dm.aq257.Close;
  end;
finally
 Frm_UnDetail.Free;
end;
end;

procedure TFrm_Unusual.BitBtn2Click(Sender: TObject);
begin
 dm.ADO257.Close;
 dm.ADO257.Open;
 dm.ADO258.Close;
 dm.ADO258.Open;
end;

procedure TFrm_Unusual.FormActivate(Sender: TObject);
begin
BitBtn2Click(Sender);
end;

procedure TFrm_Unusual.N2Click(Sender: TObject);
begin
try
 Frm_UnDetail:=TFrm_UnDetail.Create(application);
 Frm_UnDetail.State:=1; //编辑
 if Frm_UnDetail.ShowModal=mrok then
  begin
    dm.ADO257.Close;
    dm.ADO257.Prepared;
    dm.ADO257.Open;
    dm.ADO257.Locate('v_ttype',dm.aq257v_ttype.Value,[]);
    dm.aq257.Close;
  end;
finally
 Frm_UnDetail.Free;
end;
end;

procedure TFrm_Unusual.N3Click(Sender: TObject);
begin
try
 Frm_UnDetail:=TFrm_UnDetail.Create(application);
 Frm_UnDetail.State:=2; //检查
 if Frm_UnDetail.ShowModal=mrok then
  begin
  
  end;
finally
 Frm_UnDetail.Free;
end;
end;

procedure TFrm_Unusual.N4Click(Sender: TObject);
begin
 if messagedlg('您确定要删除该异常等级代码?'+dm.ADO257v_ttype.Value,mtconfirmation,[mbyes,mbno],0)=mryes then
 begin
  try
   dm.ADOConnection1.BeginTrans;
   with DM.ADOQuery1 do
   begin
     close;
     SQL.Clear;
     sql.Add('delete from data0258 where v_ttype='+quotedstr(dm.ADO257v_ttype.Value));
     ExecSQL;
   end;
   with dm.ADOQuery1 do
   begin
     close;
     sql.Clear;
     SQL.Add('delete from data0257 where v_ttype='+quotedstr(dm.ADO257v_ttype.Value));
     ExecSQL;
   end;
   dm.ADOConnection1.CommitTrans;
   BitBtn2Click(nil);
   showmsg('删除操作成功!',1);
  except
  on E: Exception do
  begin
   dm.ADOConnection1.RollbackTrans;
   ShowMessage('此审批流程使用中，不能删除!');
  end;
  end;
 end;
end;

procedure TFrm_Unusual.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
   DBGrid1.DataSource.DataSet.Filter := 'v_ttype like ''%'+trim(edit1.text)+'%'''
 else
   DBGrid1.DataSource.DataSet.Filter:='';
end;

procedure TFrm_Unusual.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADO203.CommandText);
end;

end.

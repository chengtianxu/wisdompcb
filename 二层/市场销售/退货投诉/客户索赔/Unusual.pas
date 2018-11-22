unit Unusual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, Grids, DBGrids;

type
  TFrm_Unusual = class(TForm)
    DBGrid2: TDBGrid;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1ColEnter(Sender: TObject);
  private
    { Private declarations }
  public
    usest:Boolean;
    { Public declarations }
  end;

var
  Frm_Unusual: TFrm_Unusual;

implementation

uses UnDetail, Udemo,common;

{$R *.dfm}

procedure TFrm_Unusual.N1Click(Sender: TObject);
begin
try
 Frm_UnDetail:=TFrm_UnDetail.Create(application);
 Frm_UnDetail.State:=0; //新增
  if Frm_UnDetail.ShowModal=mrok then
  begin
//    dm.ADO257.Close;
//    dm.ADO257.Prepared;
//    dm.ADO257.Open;
//    dm.ADO257.Locate('v_ttype',dm.aq257v_ttype.Value,[]);
//    dm.aq257.Close;
  end;
finally
 Frm_UnDetail.Free;
end;
end;

procedure TFrm_Unusual.FormShow(Sender: TObject);
begin
 dm.ADO607.Open;
 DM.ado608.Open;
end;

procedure TFrm_Unusual.N2Click(Sender: TObject);
begin
try
 Frm_UnDetail:=TFrm_UnDetail.Create(application);
 Frm_UnDetail.State:=1; //编辑
 if Frm_UnDetail.ShowModal=mrok then
  begin
    dm.ADO607.Close;
    dm.ADO607.Prepared;
    dm.ADO607.Open;
    dm.ADO607.Locate('v_ttype',dm.aq607v_ttype.Value,[]);
    dm.aq607.Close;
  end;
finally
 Frm_UnDetail.Free;
end;
end;

procedure TFrm_Unusual.BitBtn1Click(Sender: TObject);
begin
Close;
end;

procedure TFrm_Unusual.BitBtn2Click(Sender: TObject);
begin
 dm.ADO607.Close;
 dm.ADO607.Open;
  dm.ADO608.Close;
 dm.ADO608.Open;
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
 if messagedlg('您确定要删除?'+dm.ADO607v_ttype.Value,mtconfirmation,[mbyes,mbno],0)=mryes then
 begin
  try
   dm.ADOConnection1.BeginTrans;
//   with DM.ADOQuery1 do
//   begin
//     close;
//     SQL.Clear;
//     sql.Add('delete from data0608 where v_ttype='+quotedstr(dm.ADO607v_ttype.Value));
//     ExecSQL;
//   end;
   with dm.ADOQuery1 do
   begin
     close;
     sql.Clear;
     SQL.Add('delete from data0607 where v_ttype='+quotedstr(dm.ADO607v_ttype.Value));
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

procedure TFrm_Unusual.PopupMenu1Popup(Sender: TObject);
begin

 DM.ADOQuery1.Close;
 DM.ADOQuery1.SQL.Clear;
 DM.ADOQuery1.SQL.Add('select * from data0607');
 DM.ADOQuery1.Open;
 if DM.ADOQuery1.IsEmpty then
 begin
   N2.Enabled:=False;
   N3.Enabled:=False;
   N4.Enabled:=False;
 end
 else
  begin
   N2.Enabled:=True;
   N3.Enabled:=True;
   N4.Enabled:=True;
 end;
 if usest then
 begin
   N1.Visible:=False;
   N2.Visible:=False;
   N3.Visible:=False;
   N4.Visible:=False;
 end;

end;

procedure TFrm_Unusual.DBGrid1DblClick(Sender: TObject);
begin
//  ModalResult := mrok;
end;

procedure TFrm_Unusual.DBGrid1ColEnter(Sender: TObject);
begin
 //ModalResult := mrok;
end;

end.

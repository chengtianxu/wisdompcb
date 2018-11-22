unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids,DB, DBGridEh, Menus, StdCtrls, ExtCtrls;

type
  TFrm_0552 = class(TForm)
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Timer1: TTimer;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
  private
    { Private declarations }
    PreColumn: TColumnEh;
  public
    { Public declarations }
    v_status,rkey362:Integer;
     user_pt,warehouse_pt:Integer;
     status : Integer;

  end;

  var
  Frm_0552: TFrm_0552;
  flag:string;





implementation

uses demo,common, form_budget1;

{$R *.dfm}

procedure TFrm_0552.FormShow(Sender: TObject);

   begin
     PreColumn := DBGridEh1.Columns[0];
     DM.ads0552.Close;
     DM.ads0552.CommandText := DM.ads0552.CommandText;
     DM.ads0552.Open;
   end;

procedure TFrm_0552.N1Click(Sender: TObject);
begin
//form_budget.ShowModal;
 if (strtoint(vprev)=1)  then
  begin
    messagedlg('对不起!您没有该程序的新增权限',mtinformation,[mbok],0);
    Exit;
  end;
  try

    form_budget := Tform_budget.Create(Application);
    form_budget.status :=0;
    if form_budget.ShowModal=mrok then
    begin
      dm.ads0552.Close;
      dm.ads0552.Open;
      dm.ads0552.Locate('csi_ptr;GROUP_PTR',VarArrayOf([form_budget.user_pt,form_budget.deptcod]),[]); //定位到新增位置
//      DM.ads0552.Locate('csi_ptr',form_budget.user_pt,[]);
      ShowMsg('     新增操作成功!',1);
    end;
  finally
    form_budget.Free;
  end;
end;

procedure TFrm_0552.FormCreate(Sender: TObject);
begin
    if not App_init_2(DM.ADOConnection1) then
  begin
    ShowMessage('程序启动失败，请联系管理员');
    Application.Terminate;
  end;
  //Caption:=Application.Title;
//  rkey73:='2551';
//  user_ptr := '3054';
//  vprev := '4';
end;

procedure TFrm_0552.N3Click(Sender: TObject);
begin
     if (strtoint(vprev)=1)  then
    messagedlg('对不起!您没有该程序的删除权限',mtinformation,[mbok],0)
  else
  if MessageDlg('您确定要删除该信息接收人吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  begin
    try
      with DM.ADOQuery1 do
      begin
        Close;
        SQL.Text := 'delete data0552 where csi_ptr='+DM.ads0552csi_ptr.AsString+
        ' and GROUP_PTR='+dm.ads0552GROUP_PTR.AsString;
        if ExecSQL>0 then
        begin

          common.ShowMsg('删除操作成功！',1);
            dm.ADS0552.Close;
            dm.ADS0552.Prepared;
            dm.ADS0552.Open;
        end;
      end;
    except
      on E: Exception do
      begin
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  end;
end;

procedure TFrm_0552.N2Click(Sender: TObject);
begin
   if (strtoint(vprev)=1)  then
  begin
    messagedlg('对不起!您没有该程序的编辑权限',mtinformation,[mbok],0);
    Exit;
  end;
  try
    form_budget := Tform_budget.Create(Application);
    form_budget.status :=1;
    if form_budget.ShowModal=mrok then
    begin
      dm.ADS0552.Close;
      dm.ADS0552.Open;
      dm.ads0552.Locate('csi_ptr;GROUP_PTR',VarArrayOf([form_budget.user_pt,form_budget.warehouse_pt]),[]);
      ShowMsg('编辑操作成功!',1);
    end;
  finally
    form_budget.Free;
  end;
end;

procedure TFrm_0552.N5Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TFrm_0552.Timer1Timer(Sender: TObject);

begin

  begin
if label1.Left=0 then
begin
flag:='1'; //向右移动
end;
if label1.Left=550 then
begin
label1.Left:=0;// 将label1位置赋值到最左边
flag:='1'; //向右移动
end;
if flag='1' then
begin
label1.Left:=label1.Left+10;
end;
end;


end;

procedure TFrm_0552.FormActivate(Sender: TObject);
begin
label1.Left:=0;
end;

procedure TFrm_0552.PopupMenu1Popup(Sender: TObject);
begin
  N2.Enabled := (not DM.ads0552.IsEmpty) ;   //当没有数据的时候右键按钮下标2 3 按钮为空
  N3.Enabled := (not DM.ads0552.IsEmpty) ;
end;

procedure TFrm_0552.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
   dbgrideh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else
   dbgrideh1.DataSource.DataSet.Filter:='';

end;

procedure TFrm_0552.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ads0552.CommandText);
end;

procedure TFrm_0552.DBGridEh1TitleClick(Column: TColumnEh);
begin
   if column.Title.SortMarker = smDownEh then
  begin
   column.Title.SortMarker := smUpEh;
   DM.ads0552.IndexFieldNames:=Column.FieldName;
  end
 else
  begin
   column.Title.SortMarker:=smDownEh;
   DM.ads0552.IndexFieldNames:= Column.FieldName+' DESC';
  end;

  if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString]) then
  begin
    label2.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else
   edit1.SetFocus;
end;

end.

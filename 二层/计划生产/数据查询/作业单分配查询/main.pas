unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls,dateutils, Menus;

type
  Tfrm_main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    Eh1: TDBGridEh;
    PM1: TPopupMenu;
    pm2: TPopupMenu;
    N1: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Eh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Eh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure pm2Popup(Sender: TObject);
  private
    { Private declarations }
    sql_text:string;
    precolumn:Tcolumneh;
    procedure item_click(sender:Tobject);
  public
    { Public declarations }
    server_date:tdatetime;
  end;

var
  frm_main: Tfrm_main;

implementation
uses damo,common,condition, INFrm;

{$R *.dfm}

procedure Tfrm_main.item_click(sender:Tobject);
var i:byte;
begin
  (sender as Tmenuitem).Checked:=not ((sender as Tmenuitem).Checked);
  if (sender as Tmenuitem).Checked then
    for i:=0 to eh1.Columns.Count-1 do
       if (sender as Tmenuitem).Caption=eh1.Columns[i].Title.Caption then
        begin
         eh1.Columns[i].Visible:=true;
         break;
        end;
  if not (sender as Tmenuitem).Checked then
    for i:=0 to eh1.Columns.Count-1 do
      if (sender as Tmenuitem).Caption=eh1.Columns[i].Title.Caption then
      begin
        eh1.Columns[i].Visible:=false;
        break;
      end;
end;

procedure Tfrm_main.FormCreate(Sender: TObject);
var i:integer;
    item:Tmenuitem;
begin
  if not App_Init(dm.ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请与系统管理员联系！','提示',1);
    application.Terminate;
  end;

  for i:=1 to eh1.columns.Count do
  begin //动态增加列名到字段菜单中
    item:=Tmenuitem.Create(self);
    item.Caption:=eh1.columns[i-1].Title.caption;
    if eh1.Columns[i-1].Visible then
      item.Checked:=true;
    item.onClick:=item_click;
    self.PM1.Items.Add(item);
  end;
end;

procedure Tfrm_main.FormShow(Sender: TObject);
begin
  precolumn:=eh1.Columns[0];
  sql_text:=dm.ads489.CommandText;
  server_date:=getsystem_date(dm.aqtmp,1);
  frm_condition.DT1.Date:=server_date;
  frm_condition.DT2.Date:=server_date;
  with dm.ads489 do
  begin
    close;
    parameters.ParamByName('dt1').Value:=server_date;
    parameters.ParamByName('dt2').Value:=server_date+1;
    open;
  end;
end;

procedure Tfrm_main.Eh1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker=smupeh then
  begin
    column.Title.SortMarker:=smdowneh;
    dm.ads489.IndexFieldNames:=column.FieldName+' DESC';
  end
  else begin
    column.Title.SortMarker:=smupeh;
    dm.ads489.IndexFieldNames:=column.FieldName;
  end;

  if (column.ReadOnly) and (precolumn.FieldName<>column.FieldName) then
  begin //先把非字符型的column的readonly属性设为false,非字符型不能用edit搜索
    label1.Caption:='搜索：'+column.Title.Caption;
    precolumn.Title.Color:=clbtnface;
    column.Title.Color:=clred;
    precolumn:=column;
    edit1.Text:='';
  end;
  edit1.SetFocus;
end;

procedure Tfrm_main.Edit1Change(Sender: TObject);
begin
  if trim(edit1.Text)<>'' then
    dm.ads489.Filter:=precolumn.FieldName+' like ''%'+trim(edit1.Text)+'%'''
  else dm.ads489.Filter:='';
end;

procedure Tfrm_main.BitBtn5Click(Sender: TObject);
begin
  pm1.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure Tfrm_main.BitBtn1Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure Tfrm_main.BitBtn2Click(Sender: TObject);
begin
  dm.ads489.Close;
  dm.ads489.Open;
end;

procedure Tfrm_main.BitBtn3Click(Sender: TObject);
begin
  if not dm.ads489.Eof then
    export_dbgrideh_to_excel(eh1,self.Caption);
end;

procedure Tfrm_main.BitBtn4Click(Sender: TObject);
var i:byte;
begin
  if frm_condition.ShowModal=mrok then
  with dm.ads489 do
  begin
    close;
    commandtext:=sql_text;
    for i:=1 to frm_condition.SGrid1.RowCount-1 do
      commandtext:=commandtext+frm_condition.SGrid1.Cells[2,i];
    parameters.ParamByName('dt1').Value:=frm_condition.DT1.Date;
    parameters.ParamByName('dt2').Value:=frm_condition.DT2.Date+1;
    open;
  end;
end;

procedure Tfrm_main.Eh1KeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ads489.commandtext);
end;

procedure Tfrm_main.N1Click(Sender: TObject);
var
  LFrm: TfrmIN;
begin
  LFrm:= TfrmIN.Create(Application);
  try
    LFrm.get_treedate(dm.ads489.FieldByName('wo_ptr').AsInteger,LFrm.tv1);
    with dm.adsIN do
    begin
      close;
      CommandText:=';WITH CTE as    ' + #13+
                   ' (   ' + #13+
                   '   SELECT  rkey,wo_ptr,SOURCE_PTR from Data0489 WHERE WO_PTR = ' + inttostr(PTreeValue(LFrm.tv1.Items[0].data)^.wo_ptr) + #13+
                   '   UNION ALL    ' + #13+
                   '   SELECT data0489.rkey,Data0489.wo_ptr,Data0489.SOURCE_PTR from Data0489 inner join CTE on CTE.SOURCE_PTR = data0489.WO_PTR   ' + #13+
                   ' )     ' + #13+
                   ' SELECT D06.work_order_number AS out_wo,D25.manu_part_number AS out_no,D06.quan_sch,     ' + #13+
                   '   CASE D06.wipmat_status WHEN 0 THEN ''待分配'' ELSE ''已分配'' END AS mat_status,   ' + #13+
                   '   D489.qty,D05.employee_name,D489.tdate,D06_1.work_order_number AS inner_wo,   ' + #13+
                   '   D25_1.manu_part_number AS inner_no,D25_1.qty_bom    ' + #13+
                   ' FROM CTE INNER JOIN Data0489 d489 on CTE.rkey = d489.rkey   ' + #13+
                   '   INNER JOIN Data0006 d06 ON d489.wo_ptr=d06.rkey     ' + #13+
                   '   INNER JOIN data0025 d25 ON d06.bom_ptr=d25.rkey     ' + #13+
                   '   INNER JOIN data0006 d06_1 ON d489.source_ptr=d06_1.rkey    ' + #13+
                   '   INNER JOIN data0025 d25_1 ON d489.bom_ptr=d25_1.rkey   ' + #13+
                   '   LEFT JOIN data0005 d05 ON d489.user_ptr=d05.rkey     ';
      open;
    end;
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure Tfrm_main.pm2Popup(Sender: TObject);
begin
  N1.Enabled:= not dm.ads489.IsEmpty;
end;

end.

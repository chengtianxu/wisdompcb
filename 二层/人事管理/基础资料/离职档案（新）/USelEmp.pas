unit USelEmp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, StdCtrls, ComCtrls, Grids, DBGrids, ExtCtrls,
  Buttons, DB, ADODB;

type
  TFrmSelEmp = class(TForm)
    Label1: TLabel;
    lbl_field: TLabel;
    bbt_save: TBitBtn;
    bbt_exit: TBitBtn;
    pnl_temp: TPanel;
    dg_emp: TDBGrid;
    tv_dept: TTreeView;
    cbb_AltType: TComboBox;
    edt_value: TEdit;
    img_dept: TImageList;
    pm_msg: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure dg_empTitleClick(Column: TColumn);
    procedure bbt_exitClick(Sender: TObject);
    procedure edt_valueChange(Sender: TObject);
    procedure bbt_saveClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure cbb_AltTypeChange(Sender: TObject);

  private
    { Private declarations }
    mysql: string;

  field_name,ss:string;

  public
    { Public declarations }
  end;

var
  FrmSelEmp: TFrmSelEmp;

implementation
         uses UDM, UMain;
{$R *.dfm}

procedure TFrmSelEmp.FormShow(Sender: TObject);
var
 ssql:string;
begin
  //

   field_name:=dg_emp.Columns[0].FieldName;

   dm.qry_Empmsg.Filtered:=false;  

    //mysql:= dm.qry_Empmsg.sql.Text;
      //showmessage(dm.qry_Empmsg.sql.text);

  if frmmain.pgc1.activepageindex =0  then
  ssql:= dm.Selsql+' and status =1  '
  else
  ssql:= dm.Selsql+' and status =2  ';

  dm.OpenQry(dm.qry_Empmsg,ssql);

  //owmessage(inttostr(dm.qry_Empmsg.recordcount));
 //showmessage(dm.qry_Empmsg.sql.text);

   //if not dm.qry_Empmsg.Active  then   dm.qry_Empmsg.Open;
 


  // dm.qry_Empmsg.Filter:= 'status =1 ';




end;

procedure TFrmSelEmp.dg_empTitleClick(Column: TColumn);
var
    I,ii:Integer;
    cStr:string;
    c:TColumn;
begin
  lbl_field.Caption := Column.Title.Caption;
  field_name := Column.FieldName;
  lbl_field.Left := edt_value.Left - lbl_field.Width - 2;
   edt_value.SetFocus;

   for i:=0 to TDBGrid(Column.Grid).Columns.Count-1 do
    begin
      dg_emp.Columns[i].Title.Font.Color := clWindowText;
        dg_emp.Columns[i].Title.Font.Style := [];

        c:=TDBGrid(Column.Grid).Columns[i];
        cStr:=c.Title.Caption;
        if (pos('▲',cStr)=1) or (pos('▼',cStr)=1) then
        begin
           Delete(cStr,1,2);
           c.Title.Caption:=cStr;
        end;
    end;


    if  dm.qry_Empmsg.Sort<>(Column.FieldName+' ASC') then //判断原排序方式
    begin
        dm.qry_Empmsg.Sort := Column.FieldName+' ASC';
        Column.Title.Font.Color := clRed; //改变标题行字体为红色，表示当前的排序方式为升序
        Column.Title.Font.Style := [fsBold];
        Column.Title.Caption:='▲'+Column.Title.Caption; //标题加上三角形表示当前排序方式为升序;
    end
    else
    begin
        dm.qry_Empmsg.Sort := Column.FieldName+' DESC';
        Column.Title.Font.Color := clBlue; //改变标题行字体为蓝色，表示当前的排序方式为降序
        Column.Title.Font.Style := [fsBold];
        Column.Title.Caption:='▼'+Column.Title.Caption; //标题加上倒三角形表示当前排序方式为降序;
    end;


end;

procedure TFrmSelEmp.bbt_exitClick(Sender: TObject);
begin
close;
end;

procedure TFrmSelEmp.edt_valueChange(Sender: TObject);
var
  ssql,sstr:string;
begin

  if frmmain.pgc1.activepageindex=0 then
  sstr:='  and status=1'
  else
  sstr:=' and  status=2 ';


  ssql:=' '+field_name + ' like  ''%'+trim(edt_value.text)+'%'' '  ;

if Trim(edt_value.text)<>'' then
 begin
  with dm.qry_Empmsg do
  begin
   Filtered:=false;
   Filter:=ssql+sstr;
   filtered:=true;


  end;
  end
  else
  dm.qry_Empmsg.filtered:=false ;



end;

procedure TFrmSelEmp.bbt_saveClick(Sender: TObject);
begin
//

if dm.qry_Empmsg.IsEmpty  then exit;
if dg_emp.SelectedRows.Count<1  then
begin
ShowMessage('请选择员工！');
exit;
end;
 if (dm.pg_index=2) and (dg_emp.SelectedRows.Count>1) then
 begin
 ShowMessage('复职只能操作一个员工！');
 exit;
 end;
 //在填入结果stringgrid时才判断重复的不填入


 self.ModalResult:=mrOk;

 end;
 
procedure TFrmSelEmp.N1Click(Sender: TObject);
var
i:integer;
begin
//全选
with dm.qry_Empmsg do
  begin
    disablecontrols;
    for i:=1 to RecordCount do
      begin
        RecNo:=i;
        dg_emp.SelectedRows.CurrentRowSelected:=true;
      end;
    enablecontrols;
  end;
end;

procedure TFrmSelEmp.N2Click(Sender: TObject);
var
i:integer;
begin
//反选
with dm.qry_Empmsg do
  begin
    disablecontrols;
    for i:=1 to RecordCount do
      begin
        RecNo:=i;
        dg_emp.SelectedRows.CurrentRowSelected:=false;
      end;
    enablecontrols;
  end;

end;

procedure TFrmSelEmp.cbb_AltTypeChange(Sender: TObject);
begin
    if dm.qry_Empmsg.IsEmpty then  exit;
    dm.qry_Empmsg.Filtered:=false;
    if cbb_AltType.ItemIndex=0 then
    dm.qry_Empmsg.Filter:=' status=1'
    else
    dm.qry_Empmsg.Filter:=' status=2';

    dm.qry_Empmsg.Filtered:=true;
end;

end.

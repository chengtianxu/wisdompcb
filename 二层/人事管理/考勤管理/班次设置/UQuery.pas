unit UQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, DBCtrls,DateUtils, Grids,DB,
  Menus;

type
  TQuery_Form = class(TForm)
    bbt_cancel: TBitBtn;
    bbt_submit: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    lb_item: TLabel;
    ltb_seg: TListBox;
    sg_find: TStringGrid;
    edt_find: TEdit;
    btn_add: TButton;
    bbt_reset: TBitBtn;
    dtp_start: TDateTimePicker;
    dtp_end: TDateTimePicker;
    pm_find: TPopupMenu;
    N1: TMenuItem;
    lb_display: TLabel;
    lb_end: TLabel;
    procedure bbt_cancelClick(Sender: TObject);
    procedure bbt_submitClick(Sender: TObject);
    procedure ltb_segClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbt_resetClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Query_Form: TQuery_Form;
  sql:string;
  seg:array[0..10] of string=('操作日期','生效日期','新工号','旧工号','新部门','旧部门','新职务','旧职务','新合同类型','旧合同类型','有效性');
  dseg:array[0..10] of string=('oper_date','alterdate','new_employeecode','orginal_employeecode','ndepartmentname','odepartmentname','nposition','oposition','nhtype','ohtype','active');

implementation
{$R *.dfm}

procedure TQuery_Form.bbt_cancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TQuery_Form.bbt_submitClick(Sender: TObject);
var
i:integer;
begin
  if n1.Enabled then
    begin
    for i:= 1 to sg_find.RowCount-1 do
        begin
           sql:=sql+' and  ' + sg_find.Cells[2,i];
        end;
    ModalResult:=mrOk;
    end;   
end;

procedure TQuery_Form.ltb_segClick(Sender: TObject);
begin
  //showmessage(Tfield(ltb_seg.Items.Objects[ltb_seg.ItemIndex]).DisplayName);
  //listbox前两行是日期
  dtp_start.Visible:=ltb_seg.ItemIndex<2;
  dtp_end.Visible:=dtp_start.Visible;
  edt_find.Visible:=not dtp_start.Visible;
  lb_end.Visible:=dtp_start.Visible;
  if lb_end.visible then lb_display.caption:='开始时间' else lb_display.Caption:=ltb_seg.Items.Strings[ltb_seg.ItemIndex];
end;

procedure TQuery_Form.FormShow(Sender: TObject);
var
i:integer;
begin
  //listbox初始化
  ltb_seg.Items.Clear;
  for i:=low(seg) to high(seg) do
      ltb_seg.Items.AddObject(seg[i],tobject(dseg[i])); 
  ltb_seg.ItemIndex:=0;
  //stringgrid初始化
  sg_find.Cells[0,0]:='条件名';
  sg_find.Cells[1,0]:='条件值';
  sg_find.Cells[2,0]:='sql';
  n1.Enabled:=false;
  //sql初始化，作为返回值
  sql:='';
  //控件初始化
  edt_find.Visible:=false;
  dtp_start.DateTime:=now();
  dtp_end.DateTime:=now();
end;

procedure TQuery_Form.bbt_resetClick(Sender: TObject);
begin
 sg_find.RowCount:=2;
 sg_find.Rows[1].Clear; //将第1行删除
end;

procedure TQuery_Form.N1Click(Sender: TObject);
begin
  if sg_find.RowCount>2 then sg_find.RowCount:=sg_find.RowCount-1
  else begin
        sg_find.Rows[1].Clear;
        n1.Enabled:=false;
       end;
end;

procedure TQuery_Form.btn_addClick(Sender: TObject);
var
temp,dt:string;
begin
  temp:='';
  if (not lb_end.Visible) and (trim(edt_find.Text)='') then exit;
  with sg_find do
  begin
    RowCount:=RowCount+1;
    //添加入stringgrid
    temp:=string(ltb_seg.Items.Objects[ltb_seg.itemindex]);
    cols[0].Add(ltb_seg.Items.Strings[ltb_seg.ItemIndex]);

    if lb_end.Visible then
    begin
    //日期
        dt:=temp;
        temp:=temp+'>='''+datetostr(dtp_start.Date)+'''';
//showmessage(temp);
        temp:=temp+' and '+dt+'<='''+datetostr(dtp_end.Date)+'''';
//showmessage(temp);
        dt:='从 '+datetostr(dtp_start.Date)+' 到 '+ datetostr(dtp_end.Date);
        cols[1].Add(dt);
        cols[2].Add(temp); 
//showmessage(string(tobject(temp)));

    end else
        begin
    //其它
         temp:=temp+' like ''%'+edt_find.Text+'%''';
         cols[1].Add(edt_find.Text);
         cols[2].Add(temp);
        end;
    if not n1.Enabled then RowCount:=RowCount-1;
  end;
  n1.Enabled:=true;
  edt_find.Text:='';
end;

procedure TQuery_Form.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   sg_find.Free;
end;

end.

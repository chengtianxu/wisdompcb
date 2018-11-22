unit Qry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, DBCtrls,DateUtils, Grids,DB,
  Menus;

type
  Tfm_qry = class(TForm)
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
    bbt_1: TBitBtn;
    procedure bbt_cancelClick(Sender: TObject);
    procedure bbt_submitClick(Sender: TObject);
    procedure ltb_segClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbt_resetClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bbt_1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_qry: Tfm_qry;                     // 
  sql:string;
  seg:array[0..9] of string=('操作日期','变更日期','新工号','旧工号','新部门','旧部门','新职务','旧职务','新合同类型','旧合同类型');
  dseg:array[0..9] of string=('oper_date','alterdate','new_employeecode','orginal_employeecode','ndept.departmentname','odept.departmentname','npdet.item','opdet.item','nhdet.item','ohdet.item');
                                        //                                                                              //  odepartmentname    nposition    opdet.item   nhtype       ohtype
implementation
  uses damo, Emp, Pick_Item_Single, ConstVar, Main;
{$R *.dfm}

procedure Tfm_qry.bbt_cancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure Tfm_qry.bbt_submitClick(Sender: TObject);
var
i:integer;
obj:tobject;
temp:string;
begin
  if trim(sg_find.Cells[2,1]) ='' then
  begin
    showmessage('请添加查询条件！');
    Exit;
  end;

  if n1.Enabled then
  begin
    for i:= 1 to sg_find.RowCount-1 do
    begin
       sql:=sql+' and  ' + sg_find.Cells[2,i];
    end;
//    if fm_main.RadioGroup1.ItemIndex=0 then
//      sql := sql + ' and active=1'
//    else
//    if fm_main.RadioGroup1.ItemIndex=1 then
//      sql := sql + ' and active=0';
    ModalResult:=mrOk;
  end;
end;

procedure Tfm_qry.ltb_segClick(Sender: TObject);
begin
  //showmessage(Tfield(ltb_seg.Items.Objects[ltb_seg.ItemIndex]).DisplayName);
  //listbox前两行是日期
  dtp_start.Visible:=ltb_seg.ItemIndex<2;
  dtp_end.Visible:=dtp_start.Visible;
  edt_find.Visible:=not dtp_start.Visible;
  lb_end.Visible:=dtp_start.Visible;
  if lb_end.visible then lb_display.caption:='开始时间' else lb_display.Caption:=ltb_seg.Items.Strings[ltb_seg.ItemIndex];
  bbt_1.Visible := edt_find.Visible;

end;

procedure Tfm_qry.FormShow(Sender: TObject);
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

procedure Tfm_qry.bbt_resetClick(Sender: TObject);
begin
 sg_find.RowCount:=2;
 sg_find.Rows[1].Clear; //将第1行删除
end;

procedure Tfm_qry.N1Click(Sender: TObject);
begin
  if sg_find.RowCount>2 then sg_find.RowCount:=sg_find.RowCount-1
  else begin
        sg_find.Rows[1].Clear;
        n1.Enabled:=false;
       end;
end;

procedure Tfm_qry.btn_addClick(Sender: TObject);
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

procedure Tfm_qry.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   sg_find.Free;
end;

procedure Tfm_qry.bbt_1Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    if (lb_display.Caption = '新工号') or (lb_display.Caption ='旧工号') then
    begin
      InputVar.Fields := 'employeecode/员工工号/100,chinesename/员工姓名/100,ondutytime/入职时间/120,';
      InputVar.Sqlstr := 'select employeecode,chinesename,ondutytime from employeemsg';
      InputVar.AdoConn := DM.cn_change;
      frmPick_Item_Single.InitForm_New(InputVar) ;
      if frmPick_Item_Single.ShowModal=mrok then
      begin
        edt_find.Text := frmPick_Item_Single.adsPick.FieldValues['employeecode'];
      end;
    end;

    if (lb_display.Caption = '新部门') or (lb_display.Caption ='旧部门') then
    begin
      InputVar.Fields := 'departmentcode/部门代码/120,departmentname/部门名称/250,';
      InputVar.Sqlstr := 'select * from datadepartment';
      InputVar.AdoConn := DM.cn_change;
      frmPick_Item_Single.InitForm_New(InputVar) ;
      if frmPick_Item_Single.ShowModal=mrok then
      begin
        edt_find.Text := frmPick_Item_Single.adsPick.FieldValues['departmentname'];
      end
    end;

    if (lb_display.Caption = '新职务') or (lb_display.Caption ='旧职务') then
    begin
      InputVar.Fields := 'item/职务/380,';
      InputVar.Sqlstr := 'SELECT * from datadetail where [dictid]=1';
      InputVar.AdoConn := DM.cn_change;
      frmPick_Item_Single.InitForm_New(InputVar) ;
      if frmPick_Item_Single.ShowModal=mrok then
      begin
        edt_find.Text := frmPick_Item_Single.adsPick.FieldValues['item'];
      end
    end;

    if (lb_display.Caption = '新合同类型') or (lb_display.Caption ='旧合同类型') then
    begin
      InputVar.Fields := 'item/职务/380,,';
      InputVar.Sqlstr := 'SELECT * from datadetail where [dictid]=5';
      InputVar.AdoConn := DM.cn_change;
      frmPick_Item_Single.InitForm_New(InputVar) ;
      if frmPick_Item_Single.ShowModal=mrok then
      begin
        edt_find.Text := frmPick_Item_Single.adsPick.FieldValues['item'];
      end
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

end.

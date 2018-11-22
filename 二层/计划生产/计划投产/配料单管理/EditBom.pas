unit EditBom;

interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, Menus, DB, ADODB,
  ExtCtrls, Mask;

type
  TFrmEditBom = class(TForm)
    stg2: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Panel1: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    DBMemo1: TDBMemo;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure stg2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure stg2DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    StrL:TStringList;
    vCutNoData0492:string;
    vRkey0025:integer;
    vedit15:string;
    function Get_CutNoData0492: string;
    procedure Set_CutNoData0492(const Value: string);
    function Get_Rkey0025: integer;
    procedure Set_Rkey0025(const Value: integer);
    procedure OnClick(Sender: TObject);
    
  public
    { Public declarations }
    property CutNoData0492:string read Get_CutNoData0492 write Set_CutNoData0492 ;
    property Rkey0025:integer read Get_Rkey0025 write Set_Rkey0025 ;
  end;

var
  FrmEditBom: TFrmEditBom;

implementation

USES
   DmUnit1, bominvt,common;

{$R *.dfm}

procedure TFrmEditBom.FormShow(Sender: TObject);

begin
with stg2 do
 begin
  cells[0,0]:='工序代码';
  cells[1,0]:='步骤';
  cells[2,0]:='材料编码';
  cells[3,0]:='材料名称';
  cells[4,0]:='材料规格';
  cells[5,0]:='单位';
  cells[6,0]:='供应商';
  cells[7,0]:='配额';
  cells[8,0]:='类型';
  cells[9,0]:='列印';
  cells[10,0]:='当前库存';
  cells[11,0]:='rkey34';
  cells[12,0]:='rkey17';
  ColWidths[9]:=-1;
  ColWidths[11]:=-1;
  ColWidths[12]:=-1;
  cells[13,0]:='发放数量';
  cells[14,0]:='rkey23';
  ColWidths[14]:=-1;
  cells[15,0]:='退边料数量';
  cells[16,0]:='是否为普通库存';
  cells[17,0]:='物料替代单号';
  cells[18,0]:='代用物料编码';
  cells[19,0]:='代用物料规格';
  cells[20,0]:='物料提单序号';    //d541rkey_ptr ,不显示出来

 end;

end;

procedure TFrmEditBom.FormCreate(Sender: TObject);
begin
  StrL:=TStringList.Create;
end;

procedure TFrmEditBom.stg2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Column,Row:Integer;
begin
 { if button=mbright then
    begin
      stg2.MouseToCell(X,Y,Column,Row);
     if Row<>0 then
       stg2.Row:=Row;
  end; } 
end;

procedure TFrmEditBom.PopupMenu1Popup(Sender: TObject);
begin
  if stg2.Row=stg2.RowCount-1 then
    begin
      N2.Enabled:=False;
      N3.Enabled:=False;
    end
  else
    begin
      N2.Enabled:=True;
      N3.Enabled:=True;
    end;
end;

procedure TFrmEditBom.stg2DblClick(Sender: TObject);
begin
  if stg2.Row<>stg2.RowCount-1 then
    N2.Click;
end;

function TFrmEditBom.Get_CutNoData0492: string;
begin
  result := vCutNoData0492;
end;

procedure TFrmEditBom.Set_CutNoData0492(const Value: string);
begin
  vCutNoData0492 := value;
end;

function TFrmEditBom.Get_Rkey0025: integer;
begin
  result := vRkey0025 ;
end;

procedure TFrmEditBom.Set_Rkey0025(const Value: integer);
begin
  vRkey0025 := value ;
end;

procedure TFrmEditBom.FormActivate(Sender: TObject);
begin
     dm.ADOQueryTmp.close;
     dm.ADOQueryTmp.Parameters.ParamByName('CUT_NO').Value:=DBEdit1.text;
     dm.ADOQueryTmp.open;
     dm.ADOQuery4.close;
     dm.ADOQuery4.open;
     dm.TemADOQuery1.close;
     dm.TemADOQuery1.sql.Text:=

      'select * into #b from '+#13+
      '(SELECT  TOP 100 PERCENT Data0034.DEPT_CODE,Data0017.INV_PART_NUMBER,'+#13+
      'Data0017.INV_NAME, Data0017.INV_DESCRIPTION,'+#13+
      'Data0468.STEP, Data0468.QUAN_BOM,data0468.invent_or,'+#13+
      'Data0468.INVENT_PTR, Data0468.DEPT_PTR,Data0468.offcut_qty, Data0468.PRINTIT,'+#13+
      'Data0002.UNIT_NAME,data0017.quan_on_hand,data0468.vendor,data0468.QUAN_ISSUED,'+#13+
      'data0468.supplier_ptr,dbo.Data0541.MATERIAL_REPLACE_NO,Data0017_2.INV_PART_NUMBER as ''代用材料编码'',Data0017_2.INV_DESCRIPTION as ''代用材料规格'',Data0468.RKEY  FROM   dbo.Data0468 INNER JOIN'+#13+
      'Data0556 ON Data0468.INVENT_PTR = data0556.RKEY INNER JOIN'+#13+
      'data0017 on data0556.RKEY17=data0017.rkey INNER JOIN'+#13+
      'Data0034 ON Data0468.DEPT_PTR = Data0034.RKEY INNER JOIN'+#13+
      'dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY  Left JOIN'+#13+
      'data0541 on Data0468.d541rkey_ptr=data0541.rkey Left JOIN'+#13+
      'dbo.Data0017 as Data0017_2 ON dbo.Data0541.INVT_PTR = Data0017_2.RKEY'+#13+
      'where Data0468.cut_no='+quotedstr(dm.ADOQALL2CUT_NO.AsString)+#13+
      'and Data0468.Invent_or=1'+#13+
       'union'+#13+

      'SELECT  TOP 100 PERCENT Data0034.DEPT_CODE,Data0017.INV_PART_NUMBER,'+#13+
      'Data0017.INV_NAME, Data0017.INV_DESCRIPTION,'+#13+
      'Data0468.STEP, Data0468.QUAN_BOM,data0468.invent_or,'+#13+
      'Data0468.INVENT_PTR, Data0468.DEPT_PTR,Data0468.offcut_qty, Data0468.PRINTIT,'+#13+
      'Data0002.UNIT_NAME,data0017.quan_on_hand,data0468.vendor,data0468.QUAN_ISSUED,'+#13+
      'data0468.supplier_ptr,dbo.Data0541.MATERIAL_REPLACE_NO,Data0017_2.INV_PART_NUMBER as ''代用材料编码'',Data0017_2.INV_DESCRIPTION as ''代用材料规格'',Data0468.RKEY  FROM   dbo.Data0468 INNER JOIN'+#13+
      'Data0017 ON Data0468.INVENT_PTR = Data0017.RKEY INNER JOIN'+#13+
      'Data0034 ON Data0468.DEPT_PTR = Data0034.RKEY INNER JOIN'+#13+
      'dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY  Left JOIN'+#13+
      'data0541 on Data0468.d541rkey_ptr=data0541.rkey Left JOIN'+#13+
      'dbo.Data0017 as Data0017_2 ON dbo.Data0541.INVT_PTR = Data0017_2.RKEY'+#13+
      'where Data0468.cut_no='+quotedstr(dm.ADOQALL2CUT_NO.AsString)+#13+
      'and Data0468.Invent_or=0'+#13+
      'order by  Data0468.RKEY)A'+#13+

//      'and data0468.invent_or=0'+#13+            //标准和余料同时显示
//      'union all'+#13+
//      'SELECT  TOP 100 PERCENT Data0034.DEPT_CODE,'+#13+
//      'dbo.DATA0556.MAT_CODE, dbo.DATA0556.mat_desc,'+#13+
//      'CAST(dbo.DATA0556.LEN_SIZE AS varchar)'+#13+
//      '+ ''*'' + CAST(dbo.DATA0556.WEI_SIZE AS varchar) AS invname,'+#13+
//      'Data0468.STEP, Data0468.QUAN_BOM,data0468.invent_or,'+#13+
//      'Data0468.INVENT_PTR, Data0468.DEPT_PTR, Data0468.PRINTIT,'+#13+
//      'Data0002.UNIT_NAME,data0017.quan_on_hand,data0468.vendor,data0468.QUAN_ISSUED,'+#13+
//      'data0468.supplier_ptr FROM   dbo.Data0468 INNER JOIN'+#13+
//      'Data0556 ON Data0468.INVENT_PTR = Data0556.RKEY INNER JOIN'+#13+
//      'Data0034 ON Data0468.DEPT_PTR = Data0034.RKEY INNER JOIN'+#13+
//      'Data0017 ON data0556.rkey17 = data0017.RKEY INNER JOIN'+#13+
//      'dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY'+#13+
//      'where Data0468.cut_no='+quotedstr(dm.ADOQALL2CUT_NO.AsString)+#13+
//      'and data0468.invent_or=1'+#13+


      'update t1'+#13+
      'set t1.quan_on_hand=t2.quan_on_hand'+#13+
      'from #b t1,data0556 t2'+#13+
      'where t1.INV_PART_NUMBER=t2.MAT_CODE'+#13+
      'and substring(t1.vendor,1,2)=substring(t2.REMARK,1,2)'+#13+
      'and t1.invent_or=1'+#13+

      'select * from #b order by rkey';
     dm.TemADOQuery1.open;

     while not dm.TemADOQuery1.Eof do
      begin
       if stg2.Cells[11,stg2.RowCount-2]<>
          dm.TemADOQuery1.fieldbyname('DEPT_PTR').AsString then
        stg2.Cells[0,stg2.RowCount-1]:=dm.TemADOQuery1.fieldbyname('DEPT_CODE').AsString;
       stg2.Cells[1,stg2.RowCount-1]:=dm.TemADOQuery1.fieldbyname('STEP').AsString;

       stg2.Cells[2,stg2.RowCount-1]:=dm.TemADOQuery1.fieldbyname('INV_PART_NUMBER').AsString;
       stg2.Cells[3,stg2.RowCount-1]:=dm.TemADOQuery1.fieldbyname('INV_NAME').AsString;
       stg2.Cells[4,stg2.RowCount-1]:=dm.TemADOQuery1.fieldbyname('INV_DESCRIPTION').AsString;
       stg2.Cells[5,stg2.RowCount-1]:=dm.TemADOQuery1.fieldbyname('UNIT_NAME').AsString;
       stg2.Cells[6,stg2.RowCount-1]:=dm.TemADOQuery1.fieldbyname('vendor').AsString;
       stg2.Cells[7,stg2.RowCount-1]:=
        format('%.8f',[dm.TemADOQuery1.fieldbyname('QUAN_BOM').AsFloat]);
       if dm.TemADOQuery1.fieldbyname('invent_or').AsInteger=1 then
        stg2.Cells[8,stg2.RowCount-1]:='余料'
       else
        stg2.Cells[8,stg2.RowCount-1]:='标准';
       stg2.Cells[9,stg2.RowCount-1]:=dm.TemADOQuery1.fieldbyname('PRINTIT').AsString;


       stg2.Cells[10,stg2.RowCount-1]:= dm.TemADOQuery1.fieldbyname('quan_on_hand').AsString;
       stg2.Cells[11,stg2.RowCount-1]:=dm.TemADOQuery1.fieldbyname('DEPT_PTR').AsString;
       stg2.Cells[12,stg2.RowCount-1]:=dm.TemADOQuery1.fieldbyname('INVENT_PTR').AsString;
       stg2.Cells[13,stg2.RowCount-1]:=dm.TemADOQuery1.fieldbyname('QUAN_ISSUED').AsString;
       stg2.Cells[14,stg2.RowCount-1]:=IntToStr(dm.TemADOQuery1.fieldbyname('supplier_ptr').AsInteger);
       stg2.Cells[15,stg2.RowCount-1]:=IntToStr(dm.TemADOQuery1.fieldbyname('offcut_qty').AsInteger);
       //stg2.Cells[16,stg2.RowCount-1]:=dm.TemADOQuery1.fieldbyname('StocckName').AsString;
       stg2.Cells[16,stg2.RowCount-1]:=dm.TemADOQuery1.fieldbyname('PRINTIT').AsString;   //库存类型
       stg2.Cells[17,stg2.RowCount-1]:=dm.TemADOQuery1.fieldbyname('MATERIAL_REPLACE_NO').AsString;   //物料替代单号
       stg2.Cells[18,stg2.RowCount-1]:=dm.TemADOQuery1.fieldbyname('代用材料编码').AsString;   //代用材料编码
       stg2.Cells[19,stg2.RowCount-1]:=dm.TemADOQuery1.fieldbyname('代用材料规格').AsString;   //代用材料规格
       stg2.RowCount:=stg2.RowCount+1;
       dm.TemADOQuery1.Next;
      end;  //end with dm.adoquery1 加载BOM
end;

procedure TFrmEditBom.N1Click(Sender: TObject);

begin
 try
  with  TForm_bominvt.Create(application) do
  begin
    combobox1.Items.Add(dm.ADOQALL2CUT_NO.Value);
    combobox1.ItemIndex:=0;
    edit1.Text:=dm.ADOQALL2MANU_PART_NUMBER.Value;
    rkey25.Caption:=dm.ADOQALL2d025_rkey.AsString;

    dm.ADOQuery2.close;
    dm.ADOQuery2.Parameters.ParamByName('MANU_PART_NUMBER').Value:=dm.ADOQALL2MANU_PART_NUMBER.Value;
    dm.ADOQuery2.open;
    edit16.Text:= dm.ADOQuery2PARAMETER_VALUE.Value;


    dm.ADOQuery3.close;
    dm.ADOQuery3.Parameters.ParamByName('MANU_PART_NUMBER').Value:=dm.ADOQALL2MANU_PART_NUMBER.Value;
    dm.ADOQuery3.open;
    edit17.Text:=dm.ADOQuery3PARAMETER_VALUE.Value;

   if ShowModal=mrok then
    begin
     stg2.cells[0,stg2.RowCount-1]:=edit2.Text; //'工序代码';
     stg2.cells[1,stg2.RowCount-1]:=edit9.Text; //'步骤';
     stg2.cells[2,stg2.RowCount-1]:=edit3.Text; //'材料编码';
     stg2.cells[3,stg2.RowCount-1]:=edit4.Text; //'材料名称';
     stg2.cells[4,stg2.RowCount-1]:=edit5.Text; //'材料规格';
     stg2.cells[5,stg2.RowCount-1]:=edit8.Text; //'单位';
     stg2.cells[6,stg2.RowCount-1]:=edit7.Text; //'供应商';
     stg2.cells[7,stg2.RowCount-1]:=edit6.text; //'配额';
     //stg2.cells[8,stg2.RowCount-1]:=combobox2.Text; //'类型';

     if edit15.text='余料库存' then
      stg2.cells[8,stg2.RowCount-1]:='余料'
     else
      stg2.cells[8,stg2.RowCount-1]:='标准'; 

     if Label18.Caption='普通库存' then
      stg2.cells[9,stg2.RowCount-1]:='Y'
     else
      stg2.cells[9,stg2.RowCount-1]:='N'; //普通库存:Y;VMI库存:N;

     stg2.cells[10,stg2.RowCount-1]:=edit10.Text; //'当前库存';
     stg2.cells[11,stg2.RowCount-1]:=rkey34.caption; //'rkey34';
     stg2.cells[12,stg2.RowCount-1]:=rkey17.Caption; //'rkey17';
     stg2.cells[13,stg2.RowCount-1]:='0'; //发放数量
     stg2.cells[14,stg2.RowCount-1]:=IntToStr(BitBtn5.Tag); //rkey34
     stg2.cells[15,stg2.RowCount-1]:=edit14.text; //'退边料数量';
     vedit15:=edit15.text; //'仓库';
     //stg2.cells[16,stg2.RowCount-1]:=edit15.text; //'仓库';

     if edit15.text='VMI库存' then
      stg2.cells[16,stg2.RowCount-1]:='N'
     else
      stg2.cells[16,stg2.RowCount-1]:='Y'; //普通库存:Y;VMI库存:N;
      stg2.cells[17,stg2.RowCount-1]:=edit18.text; //'物料替代单号';
      stg2.cells[18,stg2.RowCount-1]:=edit19.text; //'代用材料编码';
      stg2.cells[19,stg2.RowCount-1]:=edit20.text; //'代用材料规格';

       if Label27.Caption<>'' then
      stg2.cells[20,stg2.RowCount-1]:=Label27.Caption //'物料替代序号';  //不显示出来，d541rkey_ptr
      else
      stg2.cells[20,stg2.RowCount-1]:='';

     stg2.RowCount:=stg2.RowCount+1;
     stg2.Row:=stg2.RowCount-2;
    end;
  end;
 finally
  Form_bominvt.Free;
 end;
end;

procedure TFrmEditBom.N3Click(Sender: TObject);
var
 i:integer;
begin
 for i:=stg2.Row to stg2.RowCount-2 do
  stg2.Rows[i].Text:=stg2.Rows[i+1].Text;
 stg2.RowCount:=stg2.RowCount-1;
end;

procedure TFrmEditBom.N2Click(Sender: TObject);
var sql_str:string;
begin
 try
 with   TForm_bominvt.Create(application) do
  begin
    combobox1.Items.Add(dm.ADOQALL2CUT_NO.Value);
    combobox1.ItemIndex:=0;
    edit1.Text:=dm.ADOQALL2MANU_PART_NUMBER.Value;
    rkey25.Caption:=dm.ADOQALL2d025_rkey.AsString;
    CheckBox3.Checked:=trim(dm.ADOQALL2green_flag.Value)='Y';
    checkbox4.Checked:=dm.ADOQALL2barcode_flag.Value=1;
    checkbox5.Checked:=dm.ADOQALL2NOPB_flag.Value=1;
    checkbox2.Checked:=trim(dm.ADOQALL2CURRENT_REV.Value)='Y';

     if  edit15.Text='余料库存' then
      begin
           Edit14.Enabled:=False;
      end
      else
         Edit14.Enabled:=True;


    dm.ADOQuery2.close;
    dm.ADOQuery2.Parameters.ParamByName('MANU_PART_NUMBER').Value:=dm.ADOQALL2MANU_PART_NUMBER.Value;
    dm.ADOQuery2.open;
    edit16.Text:= dm.ADOQuery2PARAMETER_VALUE.Value;


    dm.ADOQuery3.close;
    dm.ADOQuery3.Parameters.ParamByName('MANU_PART_NUMBER').Value:=dm.ADOQALL2MANU_PART_NUMBER.Value;
    dm.ADOQuery3.open;
    edit17.Text:=dm.ADOQuery3PARAMETER_VALUE.Value;




//20150123tang修改------------------------------
    Edit6.Enabled:=True;
    Edit7.Enabled:=True;
    BitBtn1.Enabled:=True;
    BitBtn4.Enabled:=True;
    BitBtn3.Enabled:=True;
    if (not FrmEditBom.BitBtn1.Enabled) then //检查
    begin
      Edit6.Enabled:=False;
      Edit7.Enabled:=False;
      BitBtn1.Enabled:=False;
      BitBtn4.Enabled:=False;
      BitBtn3.Enabled:=False;
      BitBtn5.Enabled:=False;
      BitBtn6.Enabled:=False;
    end;
//end20150123tang-------------------------------
    edit9.Text:=stg2.cells[1,stg2.row]; //'步骤';
    edit3.Text:=stg2.cells[2,stg2.row]; //'材料编码';
    edit4.Text:=stg2.cells[3,stg2.row]; //'材料名称';
    edit5.Text:=stg2.cells[4,stg2.row]; //'材料规格';
    edit8.Text:=stg2.cells[5,stg2.row]; //'单位';
    edit7.Text:=stg2.cells[6,stg2.row]; //'供应商';
    edit6.text:=stg2.cells[7,stg2.row]; //'配额';
    combobox2.ItemIndex:= //'类型';
      combobox2.Items.IndexOf(stg2.cells[8,stg2.row]);

//    checkbox1.Checked:=
   { if stg2.cells[9,stg2.row]='Y' then //'';
     label18.Caption:='普通库存'
    else
     label18.Caption:='VMI库存';}
    edit10.Text:=stg2.cells[10,stg2.row]; //'当前库存';

    rkey34.caption:=stg2.cells[11,stg2.row]; //'rkey34';
    rkey17.Caption:=stg2.cells[12,stg2.row]; //'rkey17';
    BitBtn5.Tag:=StrToInt(stg2.Cells[14,stg2.row]); //rkey23
    edit14.text:=stg2.cells[15,stg2.row]; //'退边料数量';
    //edit15.text:=stg2.cells[16,stg2.row]; //'仓库';
     if (stg2.cells[16,stg2.row]='Y') and (stg2.cells[8,stg2.row]='标准') then //'';
     begin
     edit15.text:='普通库存';
     Label18.Caption:='普通库存';
     end;
     if (stg2.cells[16,stg2.row]='Y') and (stg2.cells[8,stg2.row]='余料') then //'';
     begin
     edit15.text:='余料库存';
     Label18.Caption:='余料库存';
     end;
     if (stg2.cells[16,stg2.row]='N') and (stg2.cells[8,stg2.row]='标准') then //'';
     begin
     edit15.text:='VMI库存';
     Label18.Caption:='VMI库存';
     end;

    edit18.text:=stg2.cells[17,stg2.row]; //'物料代替单号';
    edit19.text:=stg2.cells[18,stg2.row]; //'代用材料编码';
    edit20.text:=stg2.cells[19,stg2.row]; //'代用材料规格';
    Label27.Caption:=stg2.cells[20,stg2.row]; //'物料替代序号';


    sql_str:='select Data0023.CODE, Data0023.abbr_NAME from data0023 '+
    'where rkey='+inttostr(BitBtn5.tag);
    openquery(dm.TemADOQuery1,sql_str);

    dm.ADOQuery15.Close;
    dm.ADOQuery15.Parameters.ParamByName('INV_PART_NUMBER').Value:=stg2.cells[2,stg2.row]; //'材料编码';
    dm.ADOQuery15.Parameters.ParamByName('Code_2').Value:=dm.TemADOQuery1.fieldbyname('CODE').AsString;
    dm.ADOQuery15.open;

    edit23.text:=dm.ADOQuery15.Fieldbyname('QUAN_ON_HAND_ABBR_NAME').AsString;

    combobox1.Enabled:=false;
    combobox2.Enabled:=false;
   if ShowModal=mrok then
    begin
      stg2.cells[0,stg2.row]:=edit2.Text; //'工序代码';
      stg2.cells[1,stg2.row]:=edit9.Text; //'步骤';
      stg2.cells[2,stg2.row]:=edit3.Text; //'材料编码';
      stg2.cells[3,stg2.row]:=edit4.Text; //'材料名称';
      stg2.cells[4,stg2.row]:=edit5.Text; //'材料规格';
      stg2.cells[5,stg2.row]:=edit8.Text; //'单位';
      stg2.cells[6,stg2.row]:=edit7.Text; //'供应商';
      stg2.cells[7,stg2.row]:=edit6.text; //'配额';
     // stg2.cells[8,stg2.row]:=combobox2.Text; //'类型';

      if edit15.text='余料库存' then
       stg2.cells[8,stg2.row]:='余料'
      else
       stg2.cells[8,stg2.row]:='标准'; //'类型';


      if Label18.Caption='普通库存' then
       stg2.cells[9,stg2.row]:='Y'
      else
       stg2.cells[9,stg2.row]:='N'; //'列印';
      stg2.cells[10,stg2.row]:=edit10.Text; //'当前库存';

      stg2.cells[11,stg2.row]:=rkey34.caption; //'rkey34';
      stg2.cells[12,stg2.row]:=rkey17.Caption; //'rkey17';

      stg2.cells[14,stg2.row]:=IntToStr(BitBtn5.Tag); //'rkey23';
      stg2.cells[15,stg2.row]:=edit14.text; //'退边料数量';
      //stg2.cells[16,stg2.row]:=edit15.text; //'仓库';

       if edit15.text='VMI库存' then
       stg2.cells[16,stg2.row]:='N'
      else
       stg2.cells[16,stg2.row]:='Y'; //'是否为VMI';

       stg2.cells[17,stg2.row]:=edit18.text;  //'物料替代单号';
       stg2.cells[18,stg2.row]:=edit19.text;  //'代用材料编码';
       stg2.cells[19,stg2.row]:=edit20.text;  //'代用材料规格';

       if Label27.Caption<>'' then
       stg2.cells[20,stg2.row]:=Label27.Caption //'物料替代序号';
       else
       stg2.cells[20,stg2.row]:='';

    end;
  end;
 finally
  Form_bominvt.Free;
 end;
end;


procedure TFrmEditBom.BitBtn1Click(Sender: TObject);
var
 i_j:integer;
 sql_text:string;
begin
try
   dm.ADOQuery5.Close;
   dm.ADOQuery5.Parameters.ParamByName('INV_PART_NUMBER').Value:=stg2.cells[2,1];
   dm.ADOQuery5.open;

   
   if  (dm.ADOQuery5.RecordCount>0) and (stg2.cells[8,1]='标准')  then
   begin
   showmessage('请优先使用余料库存!');
   end; 




   dm.ADOConnection1.BeginTrans;
   dm.ADOQuery1.Close;
   dm.ADOQuery1.SQL.Clear;
   dm.ADOQuery1.SQL.Text:='select dbo.data0207.* from dbo.data0207 '+
               'inner join dbo.data0468 on dbo.data0207.D0468_PTR=dbo.data0468.Rkey '+
               'where dbo.data0468.CUT_NO='+quotedstr(dm.ADOQALL2CUT_NO.Value);
   dm.ADOQuery1.Open;
   if (not dm.ADOQuery1.IsEmpty) then
   begin
     dm.AdoTmp.Close;
     dm.AdoTmp.SQL.Clear;
     dm.AdoTmp.SQL.Text:='update data0207 set D0468_PTR=null where D0468_PTR='+dm.ADOQuery1.FieldBYName('D0468_PTR').AsString;
     dm.AdoTmp.ExecSQL;
   end;
 sql_text:='delete data0468 where CUT_NO='+quotedstr(dm.ADOQALL2CUT_NO.Value);
 dm.TemADOQuery1.Close;
 dm.TemADOQuery1.SQL.Text:=sql_text;
 dm.TemADOQuery1.ExecSQL;

 dm.AQY468.Close;
 dm.AQY468.Parameters.ParamByName('CUT_NO').Value:=dm.ADOQALL2CUT_NO.Value;
 dm.AQY468.Open;
 for i_j:=1 to stg2.RowCount-2 do
  begin

   dm.AQY468.Append;
   dm.AQY468CUT_NO.Value:=dm.ADOQALL2CUT_NO.Value;
   dm.AQY468SO_NO.AsVariant:=dm.ADOQALL2SO_NO.AsVariant;
   dm.AQY468STEP.Value:=strtoint(stg2.cells[1,i_j]);
   dm.AQY468DEPT_PTR.Value:=strtoint(stg2.cells[11,i_j]);
   dm.AQY468INVENT_PTR.Value:=strtoint(stg2.cells[12,i_j]);
   dm.AQY468QUAN_BOM.Value:=strtofloat(stg2.cells[7,i_j]);
   dm.AQY468printit.Value:=stg2.cells[16,i_j];
   dm.AQY468STATUS.Value:=0;
   dm.AQY468VENDOR.Value:=stg2.Cells[6,i_j];     //仓库
  { if stg2.Cells[16,i_j]='余料库存' then
    dm.AQY468Invent_or.Value:=1
   else
    dm.AQY468Invent_or.Value:=0; }


    if stg2.Cells[8,i_j]='余料' then
    dm.AQY468Invent_or.Value:=1
   else
    dm.AQY468Invent_or.Value:=0;

   //dm.AQY468printit.Value:=stg2.Cells[9,i_j];//普通库存

   if StrToInt(stg2.Cells[14,i_j])>0 then
    dm.AQY468supplier_ptr.Value:=StrToInt(stg2.Cells[14,i_j]);
    dm.AQY468offcut_qty.Value:=StrToInt(stg2.Cells[15,i_j]);

    if stg2.Cells[20,i_j]<>'' then
    dm.AQY468d541rkey_ptr.Value:=StrToInt(stg2.Cells[20,i_j]);
    //else
     //dm.AQY468d541rkey_ptr.Value:=StrToInt('');

   dm.AQY468.Post;
  end; //end for i_j
  dm.ADOQALL2.Post;



  if  CheckBox1.Checked=True then
  OnClick(Sender);
////////////////////////////////////////////////////////////////////////////////////
  dm.ADOConnection1.CommitTrans ;

  showmsg('修改保存成功',1);
  self.ModalResult:=mrok;
 except
  on E: Exception do
  begin
   dm.ADOConnection1.RollbackTrans;
   messagedlg(E.Message,mterror,[mbcancel],0);
  end;
 end;
end;

procedure TFrmEditBom.OnClick(Sender: TObject);
var Qty,Qty1:real;
begin
     try
      DM.ADO468.Close;
      DM.ADO468.Parameters.ParamValues['CUT_NO'] :=QuotedStr(Trim(DBEdit1.Text));
      DM.ADO468.Open;
      DM.Fok:=true;
      Qty:=DM.ADO468QUAN_BOM.AsFloat-DM.ADO468QUAN_ISSUED.AsFloat;  //欠货
      DM.ADO22.Close;
      DM.ADO22.Parameters[0].Value:=DM.ADO468rkey17.Value;
      DM.ADO22.Open;
      Qty1:=0;
     // DM.ADOConnection1.BeginTrans;
      while not DM.ADO22.Eof do
      begin
        if DM.ADO22EXPIRE_DATE.Value<DM.FCurrDate then  //库存材料有效期已过小于当前日期
        begin
         // isExpdate:=true;
          DM.ADO22.Next;
          continue;
        end;
       DM.ADO22.Edit;
       if DM.ADO22ValQty.AsFloat < Qty then        //ValQty=现持有数量-已分配数量   小于 欠货数量
       begin
         DM.ADO22QUAN_TO_BE_STOCKED.AsFloat:=DM.ADO22QUAN_TO_BE_STOCKED.AsFloat+DM.ADO22ValQty.AsFloat;
         DM.ADO22.Post;
         DM.AdoTmp.SQL.Text:='insert into data0475 values('+DM.ADO468rkey.AsString+','+DM.ADO22RKEY.AsString+','+DM.ADO22ValQty.AsString
         +','+user_ptr+','+ QuotedStr(DateToStr(DM.FCurrDate))+')';
         DM.AdoTmp.ExecSQL;
         Qty:=Qty-DM.ADO22ValQty.AsFloat;
         Qty1:=Qty1+DM.ADO22ValQty.AsFloat;
       end
       else
       begin
         DM.ADO22QUAN_TO_BE_STOCKED.AsFloat:=DM.ADO22QUAN_TO_BE_STOCKED.AsFloat+Qty;
         Qty1:=Qty1+Qty;
         DM.ADO22.Post;
         DM.AdoTmp.SQL.Text:='insert into data0475 values('+DM.ADO468rkey.AsString+','+DM.ADO22RKEY.AsString+','+floattostr(Qty)
         +','+user_ptr+','+ QuotedStr(DateToStr(DM.FCurrDate))+')';
         DM.AdoTmp.ExecSQL;
         break;
       end;
       DM.ADO22.Next;
       end;
       if Qty1=0 then
      begin
       // DM.ADOConnection1.RollbackTrans;
        DM.ADO22.Close;
        DM.Fok:=false;
        showmessage('此材料没有可供分配的有效库存!');
        exit;
      end;
      DM.ADO22.UpdateBatch(arAll);

      DM.ADO468.Edit;
      DM.ADO468quan_alloc.Value:=Qty1;
      DM.ADO468.Post;

      DM.AdoTmp.SQL.Text:='update data0017 set QUAN_assign= QUAN_assign+'+floattostr(Qty1)+' where rkey='+DM.ADO468rkey17.AsString;
      DM.AdoTmp.ExecSQL;
      //DM.ADOConnection1.CommitTrans;
       if Qty1<DM.ADO468QUAN_BOM.AsFloat-DM.ADO468QUAN_ISSUED.AsFloat then
        showmessage('已部分分配,有效库存不足,请及时补充原材料!')
      else
        showmessage('已成功分配!');
      DM.ADO22.Close;
      DM.Fok:=false;

    except
      on  E: Exception do
      begin
       // DM.ADOConnection1.RollbackTrans;
        DM.Fok:=false;
        ShowMessage(e.message);
      end;
      //showmessage('此材料分配失败,状态已发生变化...') ;
    end;
end;



end.

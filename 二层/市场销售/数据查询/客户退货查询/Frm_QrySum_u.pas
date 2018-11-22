unit Frm_QrySum_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, ComCtrls, ExtCtrls, Grids, StdCtrls, Buttons,
  dateutils;

type
  TFrm_QrySum = class(TForm)
    GroupBox6: TGroupBox;
    Label8: TLabel;
    ComboBox1: TComboBox;
    Edit3: TEdit;
    Button3: TButton;
    BitBtn6: TBitBtn;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    SGrid1: TStringGrid;
    StaticText2: TStaticText;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    RadioGroup1: TRadioGroup;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton4: TRadioButton;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    RadioGroup2: TRadioGroup;
    rg1: TRadioGroup;
    cbb1: TComboBox;
    cbb2: TComboBox;
    procedure BitBtn3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rg1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
   procedure update_sgrid(sgrid_row: byte);    
  public
    { Public declarations }
  end;

var
  Frm_QrySum: TFrm_QrySum;

implementation

uses common,Frm_detail_u,Pick_Item_Single,ConstVar, DMUnit1, UTogather;

{$R *.dfm}

procedure TFrm_QrySum.FormCreate(Sender: TObject);
begin
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex:=0;
end;

procedure TFrm_QrySum.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_QrySum.ListBox3Click(Sender: TObject);
begin
  label8.Caption:=listbox3.Items[listbox3.itemindex];
  edit3.Text:='';
  edit3.Visible:=True;//listbox3.ItemIndex=0;
  button3.Enabled:=True;//listbox3.ItemIndex in [1,2];

  bitbtn6.Visible:=True;//listbox3.ItemIndex=0;
  {RadioButton1.Checked:=true;
  RadioButton4.Visible:=listbox3.ItemIndex=0;
  GroupBox1.Visible:=edit3.Visible;  }
  //GroupBox2.Visible:=listbox3.ItemIndex=1;
  //combobox2.Visible:=listbox3.ItemIndex=2;

end;

procedure TFrm_QrySum.Edit3Change(Sender: TObject);
begin
  button3.Enabled:=trim(edit3.Text)<>'' ;
end;

procedure TFrm_QrySum.N1Click(Sender: TObject);
var i:byte;
begin
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TFrm_QrySum.BitBtn2Click(Sender: TObject);
var i:byte;
begin
  for i:=1 to sgrid1.RowCount-2 do sgrid1.Rows[i].Clear;
  sgrid1.RowCount:=2;
end;

procedure TFrm_QrySum.update_sgrid(sgrid_row: byte);
  procedure Con(s:string);
  begin
    if RadioButton1.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton1.Caption+edit3.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' = '''+edit3.Text+''' ';
    end else if RadioButton2.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton2.Caption+edit3.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' <> '''+edit3.Text+''' ';
    end else if RadioButton4.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton4.Caption+edit3.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' like ''%'+edit3.Text+'%'' ';
    end ;
  end;
var s,s1:string;
begin
  sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
  case listbox3.itemindex of
    0:
    begin
      sgrid1.Cells[1,sgrid_row]:=edit3.Text;
      Con('and data0010.cust_code');
    end;
    1:
    begin
      sgrid1.Cells[1,sgrid_row]:=edit3.Text;
      Con('and data0025.MANU_PART_NUMBER');
    end;
    2:
    begin
      sgrid1.Cells[1,sgrid_row]:=edit3.Text;
      Con('and data0025.MANU_PART_DESC');
    end;
  end;
end;

procedure TFrm_QrySum.Button3Click(Sender: TObject);
var i:byte;
begin
  for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex]  then
  begin
    self.update_sgrid(i);
    exit;
  end;
 self.update_sgrid(sgrid1.RowCount-1);
 sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TFrm_QrySum.BitBtn6Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case self.ListBox3.ItemIndex of
    0:
    begin
      InputVar.Fields:='CUST_CODE/客户代码/110,CUSTOMER_NAME/客户名称/251,abbr_name/简称/125';
      InputVar.Sqlstr:='SELECT dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME,'+
                         'data0010.abbr_name FROM dbo.Data0010  order  by cust_code';
      inputvar.KeyField:='CUST_CODE';
      inputvar.InPut_value:=edit3.Text;
      InputVar.AdoConn := DM.ADOConnection1 ;
      frmPick_Item_Single.InitForm_New(InputVar);
      if frmPick_Item_Single.ShowModal=mrok then
      begin
        edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CUST_CODE']);
        button3.SetFocus;
      end else
        edit3.SetFocus;
    end;
    1:
    begin
      InputVar.Fields:='MANU_PART_NUMBER/本厂编号/110,MANU_PART_DESC/客户型号/251';
      InputVar.Sqlstr:='SELECT MANU_PART_NUMBER, MANU_PART_DESC '+
                       'FROM dbo.Data0025 ORDER BY MANU_PART_NUMBER';
      inputvar.KeyField:='MANU_PART_NUMBER';
      inputvar.InPut_value:=edit3.Text;
      InputVar.AdoConn := DM.ADOConnection1 ;
      frmPick_Item_Single.InitForm_New(InputVar);
      if frmPick_Item_Single.ShowModal=mrok then
      begin
        edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER']);
        button3.SetFocus;
      end else
        edit3.SetFocus;
    end;
    2:
    begin
      InputVar.Fields:='MANU_PART_DESC/客户型号/251,MANU_PART_NUMBER/本厂编号/110';
      InputVar.Sqlstr:='SELECT MANU_PART_NUMBER, MANU_PART_DESC '+
                       'FROM dbo.Data0025 ORDER BY MANU_PART_NUMBER';
      inputvar.KeyField:='MANU_PART_DESC';
      inputvar.InPut_value:=edit3.Text;
      InputVar.AdoConn := DM.ADOConnection1 ;
      frmPick_Item_Single.InitForm_New(InputVar);
      if frmPick_Item_Single.ShowModal=mrok then
      begin
        edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['MANU_PART_DESC']);
        button3.SetFocus;
      end else
        edit3.SetFocus;
    end;
  end;
 finally
   frmPick_Item_Single.Free ;
 end;
 
end;

procedure TFrm_QrySum.BitBtn1Click(Sender: TObject);
var i:integer;
    selecta,select,where,group,order:string;
    Lsql,Lstr1,Lstr11,Lstr2,Lstr22,S:string;
begin

     where:='';
    for i:=1 to sgrid1.RowCount-2 do  where:=where+sgrid1.Cells[2,i]+' ';
    where:=where+' and Data0098.RMA_DATE >='''+formatdatetime('yyyy-mm-dd',dtpk1.Date)+
               ''' and Data0098.RMA_DATE <='''+formatdatetime('yyyy-mm-dd',dtpk2.Date) +'''';
    if RadioGroup2.ItemIndex<3 then
      where:=where+' and data0060.so_tp='+inttostr(RadioGroup2.ItemIndex)+' ' ;

 if rg1.ItemIndex=0 then
 begin

  try
    screen.Cursor:=crappstart;
    case radiogroup1.ItemIndex of
      0:     //date
      begin
        select:='SELECT CONVERT(varchar, dbo.Data0098.RMA_DATE, 112) AS DATE_RECD, '+
                '       SUM(dbo.Data0098.QTY_RECD) AS QTY_RECD, '+
                '       ROUND(SUM(dbo.Data0025.unit_sq * dbo.Data0098.QTY_RECD), 6) AS SQ_RECD '+
                'FROM   dbo.Data0098 INNER JOIN '+
                '       dbo.Data0025 ON dbo.Data0098.CUSTOMER_PART_PTR = dbo.Data0025.RKEY INNER JOIN '+
                '        dbo.Data0010 ON dbo.Data0098.CUSTOMER_PTR = dbo.Data0010.RKEY LEFT OUTER JOIN '+
                '        dbo.Data0060 ON dbo.Data0098.SO_PTR = dbo.Data0060.RKEY '+
                'WHERE  (1 = 1) ';
        group:=' GROUP BY CONVERT(varchar, dbo.Data0098.RMA_DATE, 112) ';
        order:=' ORDER BY DATE_RECD';
      end;
      1:     //Month
      begin
        select:='SELECT LEFT(CONVERT(varchar, dbo.Data0098.RMA_DATE, 112), 6) AS MONTH_RECD, '+
                '       SUM(dbo.Data0098.QTY_RECD) AS QTY_RECD, '+
                '       ROUND(SUM(dbo.Data0025.unit_sq * dbo.Data0098.QTY_RECD), 6) AS SQ_RECD '+
                'FROM   dbo.Data0098 INNER JOIN '+
                '       dbo.Data0025 ON dbo.Data0098.CUSTOMER_PART_PTR = dbo.Data0025.RKEY INNER JOIN '+
                '        dbo.Data0010 ON dbo.Data0098.CUSTOMER_PTR = dbo.Data0010.RKEY LEFT OUTER JOIN '+
                '        dbo.Data0060 ON dbo.Data0098.SO_PTR = dbo.Data0060.RKEY '+
                'WHERE  (1 = 1) ';
        group:=' GROUP BY LEFT(CONVERT(varchar, dbo.Data0098.RMA_DATE, 112), 6) ';
        order:=' ORDER BY MONTH_RECD';
      end;
      2:    //Cust
      begin
        select:='SELECT dbo.Data0010.CUST_CODE, dbo.Data0010.ABBR_NAME, SUM(dbo.Data0098.QTY_RECD) AS QTY_RECD, '+
                '       ROUND(SUM(dbo.Data0025.unit_sq * dbo.Data0098.QTY_RECD), 6) AS SQ_RECD '+
                'FROM   dbo.Data0098 INNER JOIN '+
                '       dbo.Data0025 ON dbo.Data0098.CUSTOMER_PART_PTR = dbo.Data0025.RKEY INNER JOIN '+
                '        dbo.Data0010 ON dbo.Data0098.CUSTOMER_PTR = dbo.Data0010.RKEY LEFT OUTER JOIN '+
                '        dbo.Data0060 ON dbo.Data0098.SO_PTR = dbo.Data0060.RKEY '+
                'WHERE  (1 = 1) ';
        group:=' GROUP BY dbo.Data0010.CUST_CODE, dbo.Data0010.ABBR_NAME ';
        order:=' ORDER BY dbo.Data0010.CUST_CODE';
      end;
      3:    //MANU_PART_NUMBER
      begin
        select:='SELECT dbo.Data0025.MANU_PART_NUMBER, SUM(dbo.Data0098.QTY_RECD) AS QTY_RECD, '+
                '       ROUND(SUM(dbo.Data0025.unit_sq * dbo.Data0098.QTY_RECD), 6) AS SQ_RECD '+
                'FROM    dbo.Data0098 INNER JOIN '+
                '        dbo.Data0025 ON dbo.Data0098.CUSTOMER_PART_PTR = dbo.Data0025.RKEY INNER JOIN '+
                '        dbo.Data0010 ON dbo.Data0098.CUSTOMER_PTR = dbo.Data0010.RKEY LEFT OUTER JOIN '+
                '        dbo.Data0060 ON dbo.Data0098.SO_PTR = dbo.Data0060.RKEY '+
                'WHERE   (1 = 1) ';
        group:=' GROUP BY dbo.Data0025.MANU_PART_NUMBER ';
        order:=' ORDER BY dbo.Data0025.MANU_PART_NUMBER';
      end;
      4:   //Prod_type
      begin
        select:='SELECT dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME, SUM(dbo.Data0098.QTY_RECD) AS QTY_RECD, '+
                '       ROUND(SUM(dbo.Data0025.unit_sq * dbo.Data0098.QTY_RECD), 6) AS SQ_RECD '+
                'FROM   dbo.Data0098 INNER JOIN '+
                '       dbo.Data0025 ON dbo.Data0098.CUSTOMER_PART_PTR = dbo.Data0025.RKEY INNER JOIN '+
                '       dbo.Data0010 ON dbo.Data0098.CUSTOMER_PTR = dbo.Data0010.RKEY INNER JOIN '+
                '       dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY LEFT OUTER JOIN '+
                '       dbo.Data0060 ON dbo.Data0098.SO_PTR = dbo.Data0060.RKEY '+
                'WHERE  (1 = 1) ';
        group:=' GROUP BY dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME ';
        order:=' ORDER BY dbo.Data0008.PROD_CODE';
      end;
    end;

//    where:='';
//    for i:=1 to sgrid1.RowCount-2 do  where:=where+sgrid1.Cells[2,i]+' ';
//    where:=where+' and Data0098.RMA_DATE >='''+formatdatetime('yyyy-mm-dd',dtpk1.Date)+
//               ''' and Data0098.RMA_DATE <='''+formatdatetime('yyyy-mm-dd',dtpk2.Date) +'''';
//    if RadioGroup2.ItemIndex<3 then
//      where:=where+' and data0060.so_tp='+inttostr(RadioGroup2.ItemIndex)+' ' ;
    Frm_detail:=TFrm_detail.Create(application);
    Frm_detail.ADOQuery1.Close;
    Frm_detail.ADOQuery1.SQL.Text:=select+where+group+order;
    Frm_detail.ADOQuery1.Open;
    Frm_detail.ttype:=RadioGroup1.ItemIndex;
    Frm_detail.ttype_name:=radiogroup1.Items[radiogroup1.itemindex];
    screen.Cursor:=crdefault;
    Frm_detail.ShowModal;
  finally
    Frm_detail.Free;
  end;
 end
 else
 begin
  try
    if (Trim(cbb2.Text)='' ) or (Trim(cbb1.Text)='') then
    begin
     ShowMessage('请选择完整的数据汇总条件！');
     exit;
    end;
    if cbb1.ItemIndex= cbb2.ItemIndex then
    begin
     ShowMessage('汇总二维数据时横竖列不能一样！');
     exit;
    end;
    selecta:=' SUM(dbo.Data0098.QTY_RECD) AS 数量, '+
       ' ROUND(SUM(dbo.Data0025.unit_sq * dbo.Data0098.QTY_RECD), 6) AS 面积 '+
       ' FROM dbo.Data0098 INNER JOIN '+
       ' dbo.Data0025 ON dbo.Data0098.CUSTOMER_PART_PTR = dbo.Data0025.RKEY INNER JOIN '+
       ' dbo.Data0010 ON dbo.Data0098.CUSTOMER_PTR = dbo.Data0010.RKEY INNER JOIN '+
       ' dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY LEFT OUTER JOIN '+
       ' dbo.Data0060 ON dbo.Data0098.SO_PTR = dbo.Data0060.RKEY where 1=1 ';

    case cbb1.itemindex of
      0:     //date
      begin
       Lstr1:='CONVERT(char(10), dbo.Data0098.RMA_DATE, 120) AS 日期';
       Lstr11:='convert(char(10),dbo.Data0098.RMA_DATE,120)' ;
      end;
      1:     //Month
      begin
       Lstr1:='convert(char(7), dbo.Data0098.RMA_DATE,120) as 月份';
       Lstr11:='convert(char(7), dbo.Data0098.RMA_DATE,120)';
      end;
      2:    //Cust
      begin
       Lstr1:='dbo.Data0010.ABBR_NAME as 客户';
       Lstr11:='dbo.Data0010.ABBR_NAME';
      end;
      3:    //MANU_PART_NUMBER
      begin
       Lstr1:='dbo.Data0025.MANU_PART_NUMBER as 本厂编号';
       Lstr11:='dbo.Data0025.MANU_PART_NUMBER';
      end;
      4:   //Prod_type
      begin
       Lstr1:='dbo.Data0008.PRODUCT_NAME as 产品类型';
       Lstr11:='dbo.Data0008.PRODUCT_NAME';
      end;
    end;

    case cbb2.itemindex of
      0:     //date
      begin
       Lstr2:='CONVERT(char(10), dbo.Data0098.RMA_DATE, 120) AS 日期';
       Lstr22:='convert(char(10),dbo.Data0098.RMA_DATE,120)' ;
      end;
      1:     //Month
      begin
       Lstr2:='convert(char(7), dbo.Data0098.RMA_DATE,120) as 月份';
       Lstr22:='convert(char(7), dbo.Data0098.RMA_DATE,120)';
      end;
      2:    //Cust
      begin
       Lstr2:='dbo.Data0010.ABBR_NAME as 客户';
       Lstr22:='dbo.Data0010.ABBR_NAME';
      end;
      3:    //MANU_PART_NUMBER
      begin
       Lstr2:='dbo.Data0025.MANU_PART_NUMBER as 本厂编号';
       Lstr22:='dbo.Data0025.MANU_PART_NUMBER';
      end;
      4:   //Prod_type
      begin
       Lstr2:='dbo.Data0008.PRODUCT_NAME as 产品类型';
       Lstr22:='dbo.Data0008.PRODUCT_NAME';
      end;
    end;

    frmTotather:=TfrmTotather.Create(nil);
    frmTotather.pgc1.ActivePageIndex:=0;

    frmTotather.qry60_detail.close;
    frmTotather.qry60_detail.sql.clear;
    s:= 'select '+Lstr1+','+Lstr2+',' +selecta+where+' group by '+Lstr11+','+Lstr22+ ' order by '+Lstr11;
    frmTotather.qry60_detail.sql.text:= S;
    frmTotather.qry60_detail.open;
//    ShowMessage(s);

    frmTotather.qryV.close;
    frmTotather.qryV.sql.clear;
    s:=  'select '+Lstr1+',' +selecta+where+' group by '+Lstr11+ ' order by '+Lstr11;
//    showmessage(s);
    frmTotather.qryV.sql.text:= S;
    frmTotather.qryV.open;

    frmTotather.qryH.close;
    frmTotather.qryH.sql.clear;
    s:= 'select '+Lstr2+','+selecta+where+' group by '+Lstr22+ ' order by '+Lstr22;
//    showmessage(s);
    frmTotather.qryH.sql.text:= S;
    frmTotather.qryH.open;

    frmTotather.ShowModal;

  finally
    if  frmTotather=nil then
    frmTotather.Free;
  end;

 end;

 end;

procedure TFrm_QrySum.rg1Click(Sender: TObject);
begin
begin
  
   if rg1.ItemIndex=0 then
    begin
      RadioGroup1.Enabled:=true;
      cbb1.Enabled:=false;
      cbb2.Enabled:=false;
    end
    else
    begin
      RadioGroup1.Enabled:=false;
      cbb1.Enabled:=true;
      cbb2.Enabled:=true;
    end
end;
end;

procedure TFrm_QrySum.FormShow(Sender: TObject);
begin

 rg1.ItemIndex:=0;

end;

end.

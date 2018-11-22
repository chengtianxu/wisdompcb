unit Frm_detail_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, ADODB, Grids,
  DBGridEh, TeEngine, Series, TeeProcs, Chart, ExtDlgs;

type
  TFrm_detail = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    ComboBox2: TComboBox;
    CheckBox1: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Eh1: TDBGridEh;
    Chart1: TChart;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    UpDown1: TUpDown;
    Edit2: TEdit;
    Series1: TBarSeries;
    PrintDialog1: TPrintDialog;
    SavePictureDialog1: TSavePictureDialog;
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Eh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure eh60_2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
  

  public
    ttype:byte;         //分类索引
    ttype_name:string;  //分类名称
    FV,FH:integer;  //汇总时横和竖的列数
  end;

var
  Frm_detail: TFrm_detail;

implementation

uses common;

{$R *.dfm}

procedure TFrm_detail.SpeedButton1Click(Sender: TObject);
begin
  if  PageControl1.ActivePageIndex=0 then
  begin
    if (not adoquery1.IsEmpty) then Export_dbGridEH_to_Excel(eh1,tabsheet1.Caption);
  end;
end;

procedure TFrm_detail.PageControl1Change(Sender: TObject);
begin
  if pagecontrol1.ActivePageIndex=1 then
  begin
    combobox2.Enabled:=true;
    checkbox1.Enabled:=true;
    speedbutton1.Enabled:=false;
  end
  else  if pagecontrol1.ActivePageIndex=3 then
  begin
    combobox2.Enabled:=true;
    //checkbox1.Enabled:=true;
    speedbutton1.Enabled:=true;
  end
  else begin
    combobox2.Enabled:=false;
    checkbox1.Enabled:=false;
    speedbutton1.Enabled:=true;
  end;
end;

procedure TFrm_detail.SpeedButton5Click(Sender: TObject);
begin
  if PrintDialog1.Execute then   Chart1.Print;
end;

procedure TFrm_detail.SpeedButton4Click(Sender: TObject);
begin
  if SavePictureDialog1.Execute then
    chart1.SaveToBitmapFile(SavePictureDialog1.FileName+'.bmp');
end;

procedure TFrm_detail.SpeedButton6Click(Sender: TObject);
begin
  if Chart1.view3doptions.Zoom<300 then
    Chart1.view3doptions.Zoom := Chart1.view3doptions.Zoom+2;
end;

procedure TFrm_detail.SpeedButton7Click(Sender: TObject);
begin
  if Chart1.view3doptions.Zoom>1 then
    Chart1.view3doptions.Zoom := Chart1.view3doptions.Zoom-2;
end;

procedure TFrm_detail.SpeedButton2Click(Sender: TObject);
begin
  chart1.PreviousPage;
end;

procedure TFrm_detail.SpeedButton3Click(Sender: TObject);
begin
  chart1.NextPage;
end;

procedure TFrm_detail.Edit2Change(Sender: TObject);
begin
  Chart1.MaxPointsPerPage:=updown1.Position;
end;

procedure TFrm_detail.CheckBox1Click(Sender: TObject);
begin
  chart1.View3D:=CheckBox1.Checked;
end;

procedure TFrm_detail.ComboBox2Change(Sender: TObject);
begin
 //if  PageControl1.ActivePageIndex=1 then
 case combobox2.ItemIndex of
  0:
  begin
    series1.Clear;
    adoquery1.DisableControls;
    while not self.adoquery1.Eof do
    begin
      Series1.Add(ADOQuery1.Fields[2].Value,ADOQuery1.Fields[0].AsString);
      adoquery1.Next;
    end;
    adoquery1.first;
    self.Series1.ValueFormat:='#,###';
    chart1.LeftAxis.Title.Caption:=combobox2.Text;
    adoquery1.EnableControls;
  end;
  1:
  begin
    series1.Clear;
    adoquery1.DisableControls;
    while not self.adoquery1.Eof do
    begin
      Series1.Add(ADOQuery1.Fields[3].Value,ADOQuery1.Fields[0].AsString);
      adoquery1.Next;
    end;
    adoquery1.first;
    self.Series1.ValueFormat:='#,##0.00';
    chart1.LeftAxis.Title.Caption:=combobox2.Text;
    adoquery1.EnableControls;
  end;
  2:
  begin
    series1.Clear;
    adoquery1.DisableControls;
    while not self.adoquery1.Eof do
    begin
      Series1.Add(ADOQuery1.Fields[4].Value,ADOQuery1.Fields[0].AsString);
      adoquery1.Next;
    end;
    adoquery1.first;
    self.Series1.ValueFormat:='#,##0.00';
    chart1.LeftAxis.Title.Caption:=combobox2.Text;
    adoquery1.EnableControls;
  end;
  3:
  begin
    series1.Clear;
    adoquery1.DisableControls;
    while not self.adoquery1.Eof do
    begin
      Series1.Add(ADOQuery1.Fields[5].Value,ADOQuery1.Fields[0].AsString);
      adoquery1.Next;
    end;
    adoquery1.first;
    self.Series1.ValueFormat:='#,##0.00';
    chart1.LeftAxis.Title.Caption:=combobox2.Text;
    adoquery1.EnableControls;
  end;
 end;

 end;



procedure TFrm_detail.Eh1KeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then showmessage(adoquery1.SQL.Text);
end;

procedure TFrm_detail.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_detail.FormShow(Sender: TObject);
var i:integer;
begin
 if TabSheet1.TabVisible=false then Exit;
   for i:=0 to 5 do
   begin
     eh1.Columns[i].Field:=ADOQuery1.Fields[i];
     if i=2 then TFloatField(ADOQuery1.Fields[i]).DisplayFormat:='#,###';
     if i>2 then
     begin
       TFloatField(ADOQuery1.Fields[i]).DisplayFormat:='#,##0.00';
       eh1.Columns[i].Footer.FieldName:=ADOQuery1.Fields[i].FieldName;
     end;
   end;
   eh1.Columns[0].Width:=80;
   eh1.Columns[1].Width:=120;
   eh1.Columns[2].Width:=90;
   eh1.Columns[3].Width:=100;
   eh1.Columns[4].Width:=110;
   eh1.Columns[5].Width:=110;
   eh1.Columns[6].Width:=110;

   eh1.Columns[2].Title.caption:= '数量';
   eh1.Columns[3].Title.caption:= '面积';
   eh1.Columns[4].Title.caption:= '金额(不含税本币)';
   eh1.Columns[5].Title.caption:= '金额(含税本币)';

  if ttype=6 then
   begin
    eh1.Columns[6].Visible:=True;
    eh1.Columns[6].Field:=ADOQuery1.Fields[6];
   end
  else
   eh1.Columns[6].Visible:=false;
  case ttype of
   0:
   begin
     eh1.Columns[0].Title.caption:='日期';
     eh1.Columns[1].Visible:=false;
   end;
   1:
   begin
     eh1.Columns[0].Title.caption:='月份';
     eh1.Columns[1].Visible:=false;
   end;
   2:
   begin
     eh1.Columns[0].Title.caption:='产品组别';
     eh1.Columns[1].Title.caption:='组别名称';
   end;
   3:
   begin
     eh1.Columns[0].Title.caption:='业务员代码';
     eh1.Columns[1].Title.caption:='业务员名称';
   end;
   4:
   begin
     eh1.Columns[0].Title.caption:='类型代码';
     eh1.Columns[1].Title.caption:='类型名称';
   end;
   5:
   begin
     eh1.Columns[0].Title.caption:='客户代码';
     eh1.Columns[1].Title.caption:='客户名称';
   end;
   6:
   begin
     eh1.Columns[0].Title.caption:='本厂编号';
     eh1.Columns[1].Title.caption:='客户型号';
     eh1.Columns[6].Title.caption:='关联原客户';

   end;
   7:
   begin
     eh1.Columns[0].Title.caption:='产品阶数';
     eh1.Columns[1].Visible:=false;
   end;
  end;
  Tabsheet1.Caption:=ttype_name+'-'+Tabsheet1.Caption;
  chart1.Title.Text.Text:='订单汇总数据对比图('+ttype_name+')';
  ComboBox2Change(combobox2);

// if ts1.TabVisible=true then
// begin
//    for i:=1 to eh60.Columns.Count-1 do
//    eh60.Columns[i].Width:=150;
// end;


end;

procedure TFrm_detail.eh60_2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(adoquery1.SQL.Text);
end;

procedure TFrm_detail.FormActivate(Sender: TObject);
//var
// i,m,n:integer;
// s1,s2:string;
begin
// if ts1.TabVisible=false then  exit;
//
//sg1.RowCount:=FH+qryV.RecordCount+1;
//sg1.ColCount:=FV+qryH.RecordCount+1;
//
//for i:=0 to eh60_2.Columns.Count-1 do
//  eh60_2.Columns[i].Width:=100;
//
// qryV.First;  //1.列
// for i:=1 to qryV.RecordCount do
// begin
//  if (FV=1) and (FH=1) then
//  begin
//  sg1.Cells[0,i]:=qryV.Fields[0].asstring;//第一列名称
//
//        //最后一列的汇总
//  if ComboBox2.ItemIndex=0 then   //  数量
//   sg1.Cells[sg1.ColCount-1,i]:=qryV.fieldbyname('数量').AsString
//  else if ComboBox2.ItemIndex=1 then   //  面积
//   sg1.Cells[sg1.ColCount-1,i]:=qryV.fieldbyname('面积').AsString
//  else if ComboBox2.ItemIndex=1 then   //  不含税金额
//   sg1.Cells[sg1.ColCount-1,i]:=qryV.fieldbyname('不含税金额').AsString
//  else if ComboBox2.ItemIndex=1 then   //  含税金额
//   sg1.Cells[sg1.ColCount-1,i]:=qryV.fieldbyname('含税金额').AsString;
//  end
//  else  if (FV=1) and (FH=3) then
//  begin
//  sg1.Cells[0,i+2]:=qryV.Fields[0].asstring;//第一列名称
//
//  //最后一列的汇总
//  if ComboBox2.ItemIndex=0 then   //  数量
//   sg1.Cells[sg1.ColCount-1,i+2]:=qryV.fieldbyname('数量').AsString
//  else if ComboBox2.ItemIndex=1 then   //  面积
//   sg1.Cells[sg1.ColCount-1,i+2]:=qryV.fieldbyname('面积').AsString
//  else if ComboBox2.ItemIndex=1 then   //  不含税金额
//   sg1.Cells[sg1.ColCount-1,i+2]:=qryV.fieldbyname('不含税金额').AsString
//  else if ComboBox2.ItemIndex=1 then   //  含税金额
//   sg1.Cells[sg1.ColCount-1,i+2]:=qryV.fieldbyname('含税金额').AsString;
//  end
//  else  if (FV=3) and (FH=1) then
//  begin
//  sg1.Cells[0,i]:=qryV.Fields[0].asstring;//第一列名称
//  sg1.Cells[1,i]:=qryV.Fields[1].asstring;//第2列名称
//  sg1.Cells[2,i]:=qryV.Fields[2].asstring;//第3列名称
//
//        //最后一列的汇总
//  if ComboBox2.ItemIndex=0 then   //  数量
//   sg1.Cells[sg1.ColCount-1,i]:=qryV.fieldbyname('数量').AsString
//  else if ComboBox2.ItemIndex=1 then   //  面积
//   sg1.Cells[sg1.ColCount-1,i]:=qryV.fieldbyname('面积').AsString
//  else if ComboBox2.ItemIndex=1 then   //  不含税金额
//   sg1.Cells[sg1.ColCount-1,i]:=qryV.fieldbyname('不含税金额').AsString
//  else if ComboBox2.ItemIndex=1 then   //  含税金额
//   sg1.Cells[sg1.ColCount-1,i]:=qryV.fieldbyname('含税金额').AsString;
//  end;
//
//  qryV.Next;
// end;
//  ///////////////////////////////////
// qryH.First;     //行
//for i:=1 to qryH.RecordCount do
// begin
//   if (FV=1) and (FH=1) then
//   begin
//    sg1.Cells[i,0]:=qryH.Fields[0].asstring;     //第一行值
//
//        //最后一行的汇总
//    if ComboBox2.ItemIndex=0 then   //  数量
//     sg1.Cells[i,sg1.RowCount-1]:=qryH.fieldbyname('数量').AsString
//    else if ComboBox2.ItemIndex=1 then   //  面积
//     sg1.Cells[i,sg1.RowCount-1]:=qryH.fieldbyname('面积').AsString
//    else if ComboBox2.ItemIndex=1 then   //  不含税金额
//     sg1.Cells[i,sg1.RowCount-1]:=qryH.fieldbyname('不含税金额').AsString
//    else if ComboBox2.ItemIndex=1 then   //  含税金额
//   sg1.Cells[i,sg1.RowCount-1]:=qryH.fieldbyname('含税金额').AsString;
//   end
//   else  if (FV=1) and (FH=3) then
//   begin
//    sg1.Cells[i,0]:=qryH.Fields[0].asstring;     //第一行值
//    sg1.Cells[i,1]:=qryH.Fields[1].asstring;     //第一行值
//    sg1.Cells[i,2]:=qryH.Fields[2].asstring;     //第一行值
//
//        //最后一行的汇总
//    if ComboBox2.ItemIndex=0 then   //  数量
//     sg1.Cells[i,sg1.RowCount-1]:=qryH.fieldbyname('数量').AsString
//    else if ComboBox2.ItemIndex=1 then   //  面积
//     sg1.Cells[i,sg1.RowCount-1]:=qryH.fieldbyname('面积').AsString
//    else if ComboBox2.ItemIndex=1 then   //  不含税金额
//     sg1.Cells[i,sg1.RowCount-1]:=qryH.fieldbyname('不含税金额').AsString
//    else if ComboBox2.ItemIndex=1 then   //  含税金额
//     sg1.Cells[i,sg1.RowCount-1]:=qryH.fieldbyname('含税金额').AsString;
//
//   end
//    else  if (FV=3) and (FH=1) then
//   begin
//    sg1.Cells[i+2,0]:=qryH.Fields[0].asstring;     //第一行值
//
//        //最后一行的汇总
//    if ComboBox2.ItemIndex=0 then   //  数量
//     sg1.Cells[i+2,sg1.RowCount-1]:=qryH.fieldbyname('数量').AsString
//    else if ComboBox2.ItemIndex=1 then   //  面积
//     sg1.Cells[i+2,sg1.RowCount-1]:=qryH.fieldbyname('面积').AsString
//    else if ComboBox2.ItemIndex=1 then   //  不含税金额
//     sg1.Cells[i+2,sg1.RowCount-1]:=qryH.fieldbyname('不含税金额').AsString
//    else if ComboBox2.ItemIndex=1 then   //  含税金额
//     sg1.Cells[i+2,sg1.RowCount-1]:=qryH.fieldbyname('含税金额').AsString;
//   end;
//  qryH.Next;
// end;
//
// ///////////////////////////////////////////////填中间的值
//qry60_detail.DisableControls;
//qry60_detail.First;
// while not qry60_detail.Eof do  
// begin
//  if (FV=1) and (FH=1) then
//  begin
//    if ComboBox2.ItemIndex=0 then   //  数量
//    begin
//     sg1.Cells[return_col(qry60_detail.fields[1].FieldName,qry60_detail.fields[1].value),
//                  return_row(qry60_detail.fields[0].FieldName,qry60_detail.fields[0].value)]:=
//                  qry60_detail.fieldbyname('数量').asstring
//    end             
//    else  if ComboBox2.ItemIndex=1 then  // 面积
//     sg1.Cells[return_col(qry60_detail.fields[1].FieldName,qry60_detail.fields[1].value),
//                  return_row(qry60_detail.fields[0].FieldName,qry60_detail.fields[0].value)]:=
//                  qry60_detail.fieldbyname('面积').asstring
//    else  if ComboBox2.ItemIndex=2 then  // 不含税金额
//     sg1.Cells[return_col(qry60_detail.fields[1].FieldName,qry60_detail.fields[1].value),
//                  return_row(qry60_detail.fields[0].FieldName,qry60_detail.fields[0].value)]:=
//                  qry60_detail.fieldbyname('不含税金额').asstring
//      else  if ComboBox2.ItemIndex=3 then  //   含税金额
//     sg1.Cells[return_col(qry60_detail.fields[1].FieldName,qry60_detail.fields[1].value),
//                  return_row(qry60_detail.fields[0].FieldName,qry60_detail.fields[0].value)]:=
//                  qry60_detail.fieldbyname('含税金额').asstring;
//   end
//  else   if (FV=1) and (FH=3) then
//  begin
//    if ComboBox2.ItemIndex=0 then   //  数量
//    begin
//     sg1.Cells[return_col3(qry60_detail.fields[1].FieldName,qry60_detail.fields[3].FieldName,qry60_detail.fields[1].value,qry60_detail.fields[3].value),
//                  return_row(qry60_detail.fields[0].FieldName,qry60_detail.fields[0].value)+2]:=
//                  qry60_detail.fieldbyname('数量').asstring ;
//    end
//    else  if ComboBox2.ItemIndex=1 then  // 面积
//     sg1.Cells[return_col3(qry60_detail.fields[1].FieldName,qry60_detail.fields[3].FieldName,qry60_detail.fields[1].value,qry60_detail.fields[3].value),
//                  return_row(qry60_detail.fields[0].FieldName,qry60_detail.fields[0].value)+2]:=
//                  qry60_detail.fieldbyname('面积').asstring
//    else  if ComboBox2.ItemIndex=2 then  // 不含税金额
//     sg1.Cells[return_col3(qry60_detail.fields[1].FieldName,qry60_detail.fields[3].FieldName,qry60_detail.fields[1].value,qry60_detail.fields[3].value),
//                  return_row(qry60_detail.fields[0].FieldName,qry60_detail.fields[0].value)+2]:=
//                  qry60_detail.fieldbyname('不含税金额').asstring
//      else  if ComboBox2.ItemIndex=3 then  //   含税金额
//     sg1.Cells[return_col3(qry60_detail.fields[1].FieldName,qry60_detail.fields[3].FieldName,qry60_detail.fields[1].value,qry60_detail.fields[3].value),
//                  return_row(qry60_detail.fields[0].FieldName,qry60_detail.fields[0].value)+2]:=
//                  qry60_detail.fieldbyname('含税金额').asstring;
//   end
//  else   if (FV=3) and (FH=1) then
//  begin
//    if ComboBox2.ItemIndex=0 then   //  数量
//    begin
//    //m:= return_col(qryH.fields[3].FieldName,qryH.fields[3].value);
//     sg1.Cells[return_col(qry60_detail.fields[3].FieldName,qry60_detail.fields[3].value)+2,
//                  return_row3(qry60_detail.fields[0].FieldName,qry60_detail.fields[2].FieldName,qry60_detail.fields[0].value,qry60_detail.fields[2].value)]:=
//                  qry60_detail.fieldbyname('数量').asstring;
//    end
//    else  if ComboBox2.ItemIndex=1 then  // 面积
//     sg1.Cells[return_col(qry60_detail.fields[3].FieldName,qry60_detail.fields[3].value)+2,
//                  return_row3(qry60_detail.fields[0].FieldName,qry60_detail.fields[2].FieldName,qry60_detail.fields[0].value,qry60_detail.fields[2].value)]:=
//                  qry60_detail.fieldbyname('面积').asstring
//    else  if ComboBox2.ItemIndex=2 then  // 不含税金额
//     sg1.Cells[return_col(qry60_detail.fields[3].FieldName,qry60_detail.fields[3].value)+2,
//                  return_row3(qry60_detail.fields[0].FieldName,qry60_detail.fields[2].FieldName,qry60_detail.fields[0].value,qry60_detail.fields[2].value)]:=
//                  qry60_detail.fieldbyname('不含税金额').asstring
//      else  if ComboBox2.ItemIndex=3 then  //   含税金额
//     sg1.Cells[return_col(qry60_detail.fields[3].FieldName,qry60_detail.fields[3].value)+2,
//                  return_row3(qry60_detail.fields[0].FieldName,qry60_detail.fields[2].FieldName,qry60_detail.fields[0].value,qry60_detail.fields[2].value)]:=
//                  qry60_detail.fieldbyname('含税金额').asstring;
//   end;
//  qry60_detail.Next;
// end;
//
//
//    //汇总字样：
// qry60_detail.First;
// qry60_detail.EnableControls;
//
// if (FV=1) and (FH=1) then
// begin
//  sg1.Cells[0,0]:=qryV.Fields[0].FieldName;
//  sg1.Cells[sg1.ColCount-1,0]:='汇总';
//  sg1.Cells[0,sg1.RowCount-1]:='汇总';
// end
// else  if (FV=1) and (FH=3) then
// begin
//  sg1.Cells[0,2]:=qryV.Fields[0].FieldName;
//  sg1.Cells[sg1.ColCount-1,2]:='汇总';
//  sg1.Cells[0,sg1.RowCount-1]:='汇总';
// end
// else  if (FV=3) and (FH=1) then
// begin
//  sg1.Cells[0,0]:=qryV.Fields[0].FieldName;
//  sg1.Cells[1,0]:=qryV.Fields[1].FieldName;
//  sg1.Cells[2,0]:=qryV.Fields[2].FieldName;
//
//  sg1.Cells[sg1.ColCount-1,0]:='汇总';
//  sg1.Cells[0,sg1.RowCount-1]:='汇总';
// end

end;






end.

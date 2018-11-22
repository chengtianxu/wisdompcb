unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, Buttons, Grids, ExtCtrls, ComCtrls, DB,
  ADODB,ComObj, Excel2000,ClipBrd,DBGrids, Menus;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    SGrid1: TStringGrid;
    StaticText2: TStaticText;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    DTPk2: TDateTimePicker;
    DTPk1: TDateTimePicker;
    Edit1: TEdit;
    Button1: TButton;
    BitBtn4: TBitBtn;
    ADOConnection1: TADOConnection;
    ListBox1: TListBox;
    StaticText1: TStaticText;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ListBox2: TListBox;
    StaticText3: TStaticText;
    DtPk4: TDateTimePicker;
    DtPk3: TDateTimePicker;
    Button2: TButton;
    BitBtn5: TBitBtn;
    Edit2: TEdit;
    RadioGroup1: TRadioGroup;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ListBox3: TListBox;
    StaticText4: TStaticText;
    DTPk6: TDateTimePicker;
    DTPk5: TDateTimePicker;
    Button3: TButton;
    BitBtn6: TBitBtn;
    Edit3: TEdit;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DTPk7: TDateTimePicker;
    Edit4: TEdit;
    ListBox4: TListBox;
    StaticText5: TStaticText;
    DTPk8: TDateTimePicker;
    Button4: TButton;
    BitBtn7: TBitBtn;
    RGp3: TRadioGroup;
    RGp4: TRadioGroup;
    GroupBox5: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DTPk10: TDateTimePicker;
    DTPk9: TDateTimePicker;
    Button5: TButton;
    BitBtn8: TBitBtn;
    ListBox5: TListBox;
    StaticText6: TStaticText;
    Edit5: TEdit;
    GroupBox6: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    DTPk12: TDateTimePicker;
    DTpk11: TDateTimePicker;
    Button6: TButton;
    BitBtn9: TBitBtn;
    ListBox6: TListBox;
    StaticText7: TStaticText;
    Edit6: TEdit;
    BitBtn10: TBitBtn;
    Label_rkey15: TLabel;
    GroupBox7: TGroupBox;
    Label21: TLabel;
    Button7: TButton;
    BitBtn11: TBitBtn;
    ListBox7: TListBox;
    StaticText8: TStaticText;
    Edit7: TEdit;
    ADOserver_date: TADOQuery;
    ADOserver_datedate1: TStringField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    DTTm1: TDateTimePicker;
    DTTm2: TDateTimePicker;
    dttm3: TDateTimePicker;
    dttm4: TDateTimePicker;
    dttm11: TDateTimePicker;
    dttm12: TDateTimePicker;
    dttm9: TDateTimePicker;
    dttm10: TDateTimePicker;
    ComboBox1: TComboBox;
    RadioGroup3: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup4: TRadioGroup;
    CheckBox1: TCheckBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    Label19: TLabel;
    Label20: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBox3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListBox4Click(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure RGp4Click(Sender: TObject);
    procedure ListBox5Click(Sender: TObject);
    procedure Edit5KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn8Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Edit6KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBox6Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure ListBox7Click(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure CopyDbDataToExcel(Args:array of const;caption_:string);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Change(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);


  private
    { Private declarations }

    dept_ptr: integer;
  public
    { Public declarations }

  end;

var
  Form1: TForm1;

implementation
uses  inventory, inv_serach, invtype_search, supplier_search,
  warehouse_search, dpment_search, outsql, invt_quan, location_search,
  invtransfer, Employee_search, rec_total, put_total, inv_group,
  rece_put_stock, inv_minxi,common,Pick_Item_Single,ConstVar;
{$R *.dfm}


procedure TForm1.FormCreate(Sender: TObject);
begin
 if not app_init_2(ADOConnection1) then
  begin
    showmsg('程序起动失败请联系管理员!',1);
    application.Terminate;
  end;

//rkey73 :='1';
//vprev :='4';

  self.Caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';

//if ADOConnection1.Connected then
//begin
    self.ADOserver_date.Open;
    dtpk2.Date:=strtodate(self.ADOserver_datedate1.Value);
    dtpk1.Date:=dtpk2.Date-60;
    dtpk4.Date:=dtpk2.Date;
    dtpk3.Date:=dtpk2.Date-60;
    dtpk6.Date:=dtpk2.Date;
    dtpk5.Date:=dtpk2.Date-60;
    dtpk8.Date:=dtpk2.Date;
    dtpk7.Date:=dtpk2.Date-60;
    dtpk10.Date:=dtpk2.Date;
    dtpk9.Date:=dtpk2.Date-30;
    dtpk12.Date:=dtpk2.Date;
    dtpk11.Date:=dtpk2.Date-30;
//end;
end;

procedure TForm1.CopyDbDataToExcel(Args:array of const;caption_:string);
var
 iCount, jCount, v_cloumn: Integer;
 XLApp: Variant;
 Sheet: Variant;
 I: Integer;
begin
 Screen.Cursor := crHourGlass;
 if not VarIsEmpty(XLApp) then
 begin
   XLApp.DisplayAlerts := False;
   XLApp.Quit;
   VarClear(XLApp);
 end;
 try
   XLApp := CreateOleObject('Excel.Application');
 except
   Screen.Cursor := crDefault;
   Exit;
 end;
 XLApp.WorkBooks.Add;
 XLApp.SheetsInNewWorkbook := High(Args) + 1;

 for I := Low(Args) to High(Args) do
 begin
   XLApp.WorkBooks[1].WorkSheets[I+1].Name := caption_;
   Sheet := XLApp.Workbooks[1].WorkSheets[caption_];
   if not TDBGrid(Args[I].VObject).DataSource.DataSet.Active then
    begin
     Screen.Cursor := crDefault;
     Exit;
    end;
   TDBGrid(Args[I].VObject).DataSource.DataSet.DisableControls;
   TDBGrid(Args[I].VObject).DataSource.DataSet.first;

   v_cloumn:=0;
   for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
    if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
     Sheet.Cells[1, iCount + 1 - v_cloumn] :=
     TDBGrid(Args[I].VObject).Columns.Items[iCount].Title.Caption
    else
     inc(v_cloumn);

   jCount := 1;
   while not TDBGrid(Args[I].VObject).DataSource.DataSet.Eof do
   begin
     v_cloumn:=0;
     for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
      if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
       Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
       TDBGrid(Args[I].VObject).Columns.Items[iCount].Field.AsString
      else
       inc(v_cloumn);
     Inc(jCount);
     TDBGrid(Args[I].VObject).DataSource.DataSet.Next;
   end;

   XlApp.Visible := True;
   TDBGrid(Args[I].VObject).DataSource.DataSet.EnableControls;
 end;
 Screen.Cursor := crDefault;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
 i:byte;
 quantity,quan_allow,total_lucre,total_notax:double;
begin
  screen.Cursor:=crSQLWait;
  quantity:=0;
  quan_allow:=0;
  total_lucre:=0;
  total_notax:=0;
  case radiogroup1.ItemIndex of
    0:
    begin
      if (rgp4.ItemIndex=0) then//材料接收明细
      begin
        if (sgrid1.RowCount=2) then
          messagedlg('请首先定义查询条件!',mtinformation,[mbok],0)
        else
        begin
          form2:=tform2.Create(application);
          with form2.ado0022 do
          begin
            close;
            for i:=1 to sgrid1.RowCount-2 do
            begin
              sql.Add(sgrid1.Cells[2,i]);
              if sgrid1.Cells[0,i]='接收日期' then
              begin
                Form2.stardate:=self.Label19.Caption;
                Form2.enddate:=self.Label20.Caption;
              end;
            end;

            sql.Add('order by Data0496.GROUP_NAME,data0017.inv_part_number');
            Prepared;

            open;
          end;
          form2.PopupMenu1.Tag:=strtoint(vprev);
          form2.ado0022.DisableControls;
          form2.DataSource1.DataSet:=nil;
          while not form2.ado0022.Eof do
          begin
            quantity:=quantity+form2.ado0022QUANTITY.Value;
            total_lucre:=total_lucre+form2.ado0022DSDesigner2.Value;
            total_notax:=total_notax+form2.ado0022DSDesigner4.Value;
            form2.ado0022.Next;
          end;
          form2.ado0022.First;
          form2.DataSource1.DataSet:=form2.ado0022;
          form2.ado0022.EnableControls;

          form2.Edit1.Text:=formatfloat('0.00',quantity);
          form2.Edit2.Text:=formatfloat('0.0000',total_lucre);
          form2.Edit4.Text:=formatfloat('0.0000',total_notax);
          if strtoint(vprev)<=2 then       //权限
          begin
            form2.Edit2.Visible:=false;
            form2.Label2.Visible:=false;
            form2.Edit4.Visible:=false;
            form2.Label4.Visible:=false;
            form2.DBGrid1.Columns[12].Visible:=false;
            form2.DBGrid1.Columns[13].Visible:=false;
            form2.DBGrid1.Columns[14].Visible:=false;
            form2.DBGrid1.Columns[15].Visible:=false;
            form2.DBGrid1.Columns[16].Visible:=false;
            form2.DBGrid1.Columns[17].Visible:=false;
            form2.DBGrid1.Columns[18].Visible:=false;
          end;

          form2.ShowModal;
          form2.free;
        end;
      end
      else   //查找材料接收汇总数据
      begin
        form6 := tform6.Create(application);
        with form6.adotota22 do
        begin
          close;
          for i := 1 to sgrid1.RowCount-2 do sql.Insert(22,sgrid1.Cells[2,i]);
          open;
        end;
        if strtoint(vprev)<=2 then       //权限
        begin
          form6.DBGrid1.Columns[8].Visible:=false;
          form6.DBGrid1.Columns[9].Visible:=false;
        end;
        form1.Hide;
        form6.ShowModal;
        form6.Free;
      end;
    end;
    1:          //材料发放
    begin
      if rgp4.ItemIndex=0 then //发放明细
      begin
        if sgrid1.RowCount=2 then
         messagedlg('请首先定义查询条件!',mtinformation,[mbok],0)
        else
        begin
          form3:=tform3.Create(application);
          with form3.ado207 do
          begin
            close;
            for i:=1 to sgrid1.RowCount-2 do
            begin
              sql.Add(sgrid1.Cells[2,i]);
              if sgrid1.Cells[0,i]='发放日期' then
              begin
                Form3.stardate:=self.Label19.Caption;
                Form3.enddate:=self.Label20.Caption;
              end;
            end;
            sql.Add('order by Data0023.CODE,Data0034.DEPT_CODE,data0017.inv_part_number');
            Prepared;
//            ShowMessage(SQL.Text);
            open;
          end;

          form3.ado207.DisableControls;
          form3.DataSource1.DataSet:=nil;
          while not form3.ado207.Eof do
          begin
            quantity:=quantity+form3.ado207QUANTITY.Value;
            total_lucre:=total_lucre+form3.ado207total_price.Value;
            total_notax:=total_notax+form3.ado207total_notaxprice.Value;
            form3.ado207.Next;
          end;
          form3.ado207.First;
          form3.DataSource1.DataSet:=form3.ado207;
          form3.ado207.EnableControls;

          form3.Edit1.Text:=formatfloat('0.00',quantity);
          form3.edit2.Text:=formatfloat('0.0000',total_lucre);
          form3.edit4.Text:=formatfloat('0.0000',total_notax);
          if strtoint(vprev)<=2 then       //权限
          begin
            form3.Label2.Visible:=false;
            form3.Edit2.Visible:=false;
            form3.edit4.visible:=false;
            form3.Label4.Visible:=false;
            form3.DBGrid1.Columns[14].Visible:=false;
            form3.DBGrid1.Columns[15].Visible:=false;
            form3.DBGrid1.Columns[16].Visible:=false;
            form3.DBGrid1.Columns[17].Visible:=false;
            form3.DBGrid1.Columns[18].Visible:=false;
          end;
          form1.Hide;
          form3.ShowModal;
          form3.free;
        end;
      end
      else  //发放汇总
      begin
        if sgrid1.RowCount=2 then
          messagedlg('请首先定义查询条件!',mtinformation,[mbok],0)
        else
        begin
          form7 := tform7.Create(application);
          with form7.adotota207 do
          begin
            close;
            for i := 1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-4,sgrid1.Cells[2,i]);
            open;
          end;
          if strtoint(vprev)<=2 then       //权限
          begin
            form7.DBGrid1.Columns[8].Visible:=false;
            form7.DBGrid1.Columns[9].Visible:=false;
          end;
          form1.Hide;
          form7.ShowModal;
          form7.Free;
        end;
      end;
    end;
    2:
    if rgp4.ItemIndex=0 then//材料库存明细查询
    begin
      form9:=tform9.Create(application);
      with form9.ado0022 do
      begin
        close;
        for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-1,sgrid1.Cells[2,i]);
        Prepared;
        open;
      end;

      form9.PopupMenu1.Tag:=strtoint(vprev);    //权限

      form9.ado0022.DisableControls;
      form9.DataSource1.DataSet:=nil;
      while not form9.ado0022.Eof do
      begin
        quantity:=quantity+form9.ado0022QUAN_ON_HAND.Value;
        quan_allow:=quan_allow+form9.ado0022quan_allow.Value;
        total_lucre:=total_lucre+form9.ado0022amount_tax.Value;
        total_notax:=total_notax+form9.ado0022amount_notax.Value;
        form9.ado0022.Next;
      end;
      form9.ado0022.First;
      form9.DataSource1.DataSet:=form9.ado0022;
      form9.ado0022.EnableControls;

      form9.Edit1.Text:=formatfloat('0.00',quantity);
      form9.Edit5.Text:=formatfloat('0.00',quan_allow);
      form9.edit2.Text:=formatfloat('0.0000',total_lucre);
      form9.edit4.Text:=formatfloat('0.0000',total_notax);

      if strtoint(vprev)<=2 then       //权限
      begin
        for i:=12 to 20 do form9.DBGrid1.Columns[i].Visible:=false;
        form9.edit2.Visible:=false;
        form9.Edit4.Visible:=false;
        form9.Label2.Visible:=false;
        form9.Label4.Visible:=false;
      end;
      form1.Hide;
      form9.ShowModal;
      form9.free;
    end
    else          //库存汇总
    begin
      form4:=tform4.Create(application);
      with form4.ado22 do
      begin
        close;
        for i:=1 to sgrid1.RowCount-2 do
         sql.Insert(sql.Count-7,sgrid1.Cells[2,i]);
        open;
      end;
      if strtoint(vprev)<=2 then       //权限
      begin
        form4.DBGrid1.Columns[9].Visible:=false;
        form4.DBGrid1.Columns[10].Visible:=false;
        form4.DBGrid1.Columns[11].Visible:=false;
      end;
      form1.Hide;
      form4.ShowModal;
      form4.free;
    end;
    3:
    begin
      form5:=tform5.Create(application);
      with form5.ado27 do
      begin
        close;
        for i:=1 to sgrid1.RowCount-2 do
         sql.Insert(form5.ado27.SQL.Count-1,sgrid1.Cells[2,i]);
        open;
      end;
      if form5.ado27.IsEmpty then
        messagedlg('对不起!没有找到符合条件的数据',mtinformation,[mbok],0)
      else
      begin
        form1.Hide;
        form5.ShowModal;
        form5.free;
      end;
    end;
  end;
  screen.Cursor:=crDefault;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
  label2.Caption:=listbox1.Items[listbox1.itemindex];
  edit1.Text:='';
  button1.Enabled:=false;
  bitbtn4.Visible:=false;
  dttm1.Visible:=false;
  dttm2.Visible:=false;
  radiogroup3.Visible:=true;
  case listbox1.ItemIndex of
    0:
    begin
      edit1.Visible:=true;
      label3.Visible:=false;
      label4.Visible:=false;
      dtpk1.Visible:=false;
      dtpk2.Visible:=false;
      ComboBox2.Visible:=False;
    end;
    1,11:
    begin
      bitbtn4.Visible:=true;
      edit1.Visible:=true;
      label3.Visible:=false;
      label4.Visible:=false;
      dtpk1.Visible:=false;
      dtpk2.Visible:=false;
      ComboBox2.Visible:=False;
    end;
    2:
    begin
      bitbtn4.Visible:=true;
      edit1.Visible:=true;
      label3.Visible:=false;
      label4.Visible:=false;
      dtpk1.Visible:=false;
      dtpk2.Visible:=false;
      ComboBox2.Visible:=False;
    end;
    3:
    begin
      edit1.Visible:=true;
      label3.Visible:=false;
      label4.Visible:=false;
      dtpk1.Visible:=false;
      dtpk2.Visible:=false;
      ComboBox2.Visible:=False;
    end;
    4:
    begin
      button1.Enabled:=true;
      edit1.Visible:=false;
      label3.Visible:=true;
      label4.Visible:=true;
      dtpk1.Visible:=true;
      dtpk2.Visible:=true;
      dttm1.Visible:=true;
      dttm2.Visible:=true;
      ComboBox2.Visible:=False;
      radiogroup3.Visible:=false;
    end;
    5:
    begin
      bitbtn4.Visible:=true;
      label3.Visible:=false;
      label4.Visible:=false;
      dtpk1.Visible:=false;
      dtpk2.Visible:=false;
      edit1.Visible:=true;
      ComboBox2.Visible:=False;
    end;
    6,13:       //工厂;仓库
    begin
      bitbtn4.Visible:=true;
      edit1.Visible:=true;
      label3.Visible:=false;
      label4.Visible:=false;
      dtpk1.Visible:=false;
      dtpk2.Visible:=false;
      ComboBox2.Visible:=False;
    end;
    7:
    begin
      edit1.Visible:=true;
      label3.Visible:=false;
      label4.Visible:=false;
      dtpk1.Visible:=false;
      dtpk2.Visible:=false;
      ComboBox2.Visible:=False;
    end;
    8:
    begin
      bitbtn4.Visible:=true;
      edit1.Visible:=true;
      label3.Visible:=false;
      label4.Visible:=false;
      dtpk1.Visible:=false;
      dtpk2.Visible:=false;
      ComboBox2.Visible:=False;
    end;
    9:
    begin
      edit1.Visible:=true;
      label3.Visible:=false;
      label4.Visible:=false;
      dtpk1.Visible:=false;
      dtpk2.Visible:=false;
      ComboBox2.Visible:=False;
    end;
    10:
    begin
      ComboBox2.Visible:=True;
      edit1.Visible:=false;
      label3.Visible:=false;
      label4.Visible:=false;
      dtpk1.Visible:=false;
      dtpk2.Visible:=false;
      Button1.Enabled:=True;
      radiogroup3.Visible:=false;
    end;
    12:
    begin
      edit1.Visible:=true;
      label3.Visible:=false;
      label4.Visible:=false;
      dtpk1.Visible:=false;
      dtpk2.Visible:=false;
      ComboBox2.Visible:=False;
      Button1.Enabled:=False;
    end;
  end;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
case listbox1.ItemIndex of
1:
 begin
  form_inv:=tform_inv.Create(application);
  form_inv.ADOQuery1.Close;
  form_inv.ADOQuery1.Parameters[1].Value:=trim(edit1.Text);
  form_inv.ADOQuery1.Open;
  if form_inv.ShowModal=mrok then
   begin
    edit1.Text:=trim(form_inv.ADOQuery1INV_PART_NUMBER.Value);
    button1.Enabled:=true;
    button1.SetFocus;
   end
  else
   edit1.SetFocus;
  form_inv.free;
 end;
2:
 begin
  form_invtype:=tform_invtype.Create(application);
  if form_invtype.ShowModal=mrok then
   begin
    edit1.Text:=trim(form_invtype.ADOQuery1GROUP_NAME.Value);
    button1.Enabled:=true;
    button1.SetFocus;
   end
  else
   edit1.SetFocus;
  form_invtype.free;
 end;
5:
 begin
  form_supp:=tform_supp.Create(application);
  if form_supp.ShowModal=mrok then
   begin
    edit1.Text:=trim(form_supp.adoquery1code.Value);
    button1.Enabled:=true;
    button1.SetFocus;
   end
  else
   edit1.SetFocus;
  form_supp.free;
 end;
6:
 begin
  form_wh:=tform_wh.Create(application);
  if form_wh.ShowModal=mrok then
   begin
    edit1.Text:=trim(form_wh.ADOQuery1WAREHOUSE_CODE.Value);
    button1.Enabled:=true;
    button1.SetFocus;
   end
  else
   edit1.SetFocus;
  form_wh.free;
 end;
8:
 begin
  form_invgroup:=tform_invgroup.Create(application);
  if form_invgroup.ShowModal=mrok then
   begin
    edit1.Text:=trim(form_invgroup.ADOQuery1inv_group_name.Value);
    button1.Enabled:=true;
    button1.SetFocus;
   end
  else
   edit1.SetFocus;
  form_invgroup.Free;
 end;
11:
 begin
   frmPick_Item_Single:=TfrmPick_Item_Single.Create(application) ;
   try
      InputVar.Fields := 'CURR_CODE/货币代码/200,CURR_NAME/货币名称/200';
      InputVar.Sqlstr :='SELECT RKEY, CURR_CODE, CURR_NAME FROM dbo.Data0001';
      inputvar.KeyField:='CURR_CODE';
    inputvar.InPut_value:=Edit1.Text;
    InputVar.AdoConn := self.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CURR_CODE']);
      Button1.SetFocus
    end else Edit1.SetFocus;
   finally
     frmPick_Item_Single.Free ;
   end;
 end;

 13:
 begin
  form_lo:=tform_lo.Create(application);
  if form_lo.ShowModal=mrok then
   begin
    edit1.Text:=trim(form_lo.ADOQuery1.FieldValues['code']);

    button1.Enabled:=true;
    button1.SetFocus;
   end
  else
   edit1.SetFocus;
  form_lo.free;
 end;

end;

end;

procedure TForm1.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit1.Text)<>'' then
 button1.Enabled:=true
else
 button1.Enabled:=false;
end;

procedure TForm1.Button1Click(Sender: TObject);
 var
   i,j:byte;
   hasadded:boolean; //用于判断查询项目是否已添加
begin
   hasadded := False;
  for i:=1 to sgrid1.RowCount-2 do
   if sgrid1.Cells[0,i]=listbox1.Items[listbox1.itemindex]  then
    begin
     hasadded :=True;
     j := i;
     Break;
    end;
  if  hasadded =False then
   begin
     j := sgrid1.RowCount-1;
     sgrid1.RowCount:=sgrid1.RowCount+1;
   end;

      sgrid1.Cells[0,j]:=listbox1.Items[listbox1.itemindex];
      sgrid1.Cells[1,j]:=edit1.Text;
     case listbox1.ItemIndex of
     0:
       case radiogroup3.ItemIndex of
        0:sgrid1.Cells[2,j]:='and Data0070.PO_NUMBER = '''+trim(edit1.Text)+'''';
        1:sgrid1.Cells[2,j]:='and Data0070.PO_NUMBER LIKE ''%'+trim(edit1.Text)+'%''';
       end;
     1:
      case radiogroup3.ItemIndex of
        0:sgrid1.Cells[2,j]:='and Data0017.INV_PART_NUMBER = '''+trim(edit1.Text)+'''';
        1:sgrid1.Cells[2,j]:='and Data0017.INV_PART_NUMBER LIKE ''%'+trim(edit1.Text)+'%''';
      end;
      2:
        case radiogroup3.ItemIndex of
         0:sgrid1.Cells[2,j]:='and Data0496.GROUP_NAME = '''+trim(edit1.Text)+'''';
         1:sgrid1.Cells[2,j]:='and Data0496.GROUP_NAME LIKE ''%'+trim(edit1.Text)+'%''';
        end;
      3:
        case radiogroup3.ItemIndex of
          0:sgrid1.Cells[2,j]:='and Data0456.GRN_NUMBER = '''+trim(edit1.Text)+'''';
          1:sgrid1.Cells[2,j]:='and Data0456.GRN_NUMBER LIKE ''%'+trim(edit1.Text)+'%''';
        end;
      4:
        begin
         sgrid1.Cells[1,j]:='从'+datetostr(dtpk1.date)+'到'+datetostr(dtpk2.date);
         sgrid1.Cells[2,j]:= //材料接收长日期格式
         'and  Data0456.ship_DATE>='''+datetostr(dtpk1.date)+
         formatdatetime(' hh:nn:ss',DTtm1.Time)+
         '''and Data0456.ship_DATE<='''+datetostr(dtpk2.date)+
         formatdatetime(' hh:nn:ss',DTtm2.Time)+'''';
         label19.Caption:=datetostr(dtpk1.date)+
         formatdatetime(' hh:nn:ss',self.Dttm1.Time);
         label20.Caption:=datetostr(dtpk2.date)+
         formatdatetime(' hh:nn:ss',self.Dttm2.Time);
        end;
      5:
      case radiogroup3.ItemIndex of
        0:sgrid1.Cells[2,j] := 'and data0023.code = '''+trim(edit1.Text)+'''';
        1:sgrid1.Cells[2,j] := 'and data0023.code LIKE ''%'+trim(edit1.Text)+'%''';
      end;
      6:
      case radiogroup3.ItemIndex of
        0:sgrid1.Cells[2,j] := 'and data0015.warehouse_code = '''+trim(edit1.Text)+'''';
        1:sgrid1.Cells[2,j] := 'and data0015.warehouse_code LIKE ''%'+trim(edit1.Text)+'%''';
      end;
      7:
      case radiogroup3.ItemIndex of
        0:sgrid1.Cells[2,j] := 'and Data0456.DELIVER_NUMBER = '''+trim(edit1.Text)+'''';
        1:sgrid1.Cells[2,j] := 'and Data0456.DELIVER_NUMBER LIKE ''%'+trim(edit1.Text)+'%''';
      end;
      8:
      case radiogroup3.ItemIndex of
        0:sgrid1.Cells[2,j] := 'and Data0019.inv_group_name = '''+trim(edit1.Text)+'''';
        1:sgrid1.Cells[2,j] := 'and Data0019.inv_group_name LIKE ''%'+trim(edit1.Text)+'%''';
      end;
      9:
      case radiogroup3.ItemIndex of
        0:sgrid1.Cells[2,j]:='and Data0017.INV_NAME = '''+trim(edit1.Text)+'''';
        1:sgrid1.Cells[2,j]:='and Data0017.INV_NAME LIKE ''%'+trim(edit1.Text)+'%''';
      end;
      10:
      begin
        sgrid1.Cells[1,j]:=ComboBox2.Text;

        if ComboBox2.ItemIndex=0 then
          sgrid1.Cells[2,j]:='and data0456.ttype = 1'
        else
        if ComboBox2.ItemIndex=1 then
          sgrid1.Cells[2,j]:='and data0456.ttype =3'
        else
          sgrid1.Cells[2,j]:='and data0456.ttype = 5';
      end;
      11:
      begin
        case radiogroup3.ItemIndex of
        0:sgrid1.Cells[2,j]:='and Data0001.CURR_CODE = '''+trim(edit1.Text)+'''';
        1:sgrid1.Cells[2,j]:='and and Data0001.CURR_CODE LIKE ''%'+trim(edit1.Text)+'%''';
        end;
      end;
      12:
      case radiogroup3.ItemIndex of
        0:sgrid1.Cells[2,j]:='and Data0017.INV_DESCRIPTION = '''+trim(edit1.Text)+'''';
        1:sgrid1.Cells[2,j]:='and Data0017.INV_DESCRIPTION LIKE ''%'+trim(edit1.Text)+'%''';
      end;
      13:
      case radiogroup3.ItemIndex of
        0:sgrid1.Cells[2,j] := 'and data0016.code = '''+trim(edit1.Text)+'''';
        1:sgrid1.Cells[2,j] := 'and data0016.code LIKE ''%'+trim(edit1.Text)+'%''';
      end;

     end;


end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-1 do
  sgrid1.Rows[i].Clear;
 sgrid1.RowCount:=2;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
  bitbtn2click(sender);

  if groupbox5.Visible = true then
   groupbox5.Visible := false;
  if groupbox6.Visible = true then
   groupbox6.Visible := false;
  if groupbox7.Visible = true then
   groupbox7.Visible := false;

  rgp4.ItemIndex:=0;
  rgp4.Visible:=true;

  case radiogroup1.ItemIndex of
    0:
     begin
      groupbox1.Visible:=true;
      groupbox2.Visible:=false;
      groupbox3.Visible:=false;
      groupbox4.Visible:=false;

      listbox1.Selected[0]:=true;
      listbox1click(sender);
     end;
    1:
     begin
      groupbox1.Visible:=false;
      groupbox3.Visible:=false;
      groupbox2.Visible:=true;
      groupbox4.Visible:=false;

      listbox2.Selected[0]:=true;
      listbox2click(sender);
     end;
    2:
     begin
      groupbox1.Visible:=false;
      groupbox3.Visible:=false;
      groupbox7.Visible:=true;
      groupbox2.Visible:=false;
      groupbox4.Visible:=false;

      listbox7.Selected[0]:=true;
    //  listbox7click(sender);
     end;
    3:
     begin
      groupbox1.Visible:=false;
      groupbox3.Visible:=false;
      groupbox2.Visible:=false;
      groupbox4.Visible:=true;
      rgp4.Visible:=false;
      listbox4.Selected[0]:=true;
      listbox4click(sender);
     end;
  end;

end;

procedure TForm1.ListBox2Click(Sender: TObject);
begin
  label6.Caption:=listbox2.Items[listbox2.itemindex];
  edit2.Text:='';
  edit2.Visible:=true;
  button2.Enabled:=false;
  edit2.Enabled:=true;
  bitbtn5.Visible:=true;
  label5.Visible:=false;
  label1.Visible:=false;
  dtpk3.Visible:=false;
  dtpk4.Visible:=false;
  dttm3.Visible:=false;
  dttm4.Visible:=false;
  radiogroup2.Visible:=true;

  RadioGroup2.Items.Clear;
  RadioGroup2.Items.Add('等于 =');
  RadioGroup2.Items.Add('相似 Like');
  RadioGroup2.ItemIndex:=0;
  ComboBox4.Visible:=False;
  case listbox2.ItemIndex of
    0:bitbtn5.Visible:=false;
    1:;
    2:;
    3:bitbtn5.Visible:=false;
    4:;
    5:
      begin
        bitbtn5.Visible:=false;
        label5.Visible:=true;
        label1.Visible:=true;
        dtpk3.Visible:=true;
        dtpk4.Visible:=true;
        dttm3.Visible:=true;
        dttm4.Visible:=true;
        button2.Enabled:=true;
        edit2.Visible:=false;
        radiogroup2.Visible:=false;
      end;
    6:;
    7,16:
      begin
        edit2.Enabled:=false;
        radiogroup2.Visible:=false;
      end;
    8:bitbtn5.Visible:=false;
    9..11:;
    12,13:BitBtn5.Visible :=False;
    14:
    begin
     BitBtn5.Visible:=false;
     RadioGroup2.Items.Clear;
     RadioGroup2.Items.Add('等于 =');
     RadioGroup2.Items.Add('大于 >');
     RadioGroup2.Items.Add('小于 <');
     RadioGroup2.ItemIndex:=1;
    end;
    15:
    begin
      radiogroup2.Visible:=false;
      BitBtn5.Visible:=false;
      ComboBox4.Items.Clear;
      ComboBox4.Items.Add('编码入库');
      ComboBox4.Items.Add('直接入库');
      ComboBox4.Items.Add('调拔入库');
      ComboBox4.Items.Add('VMI入库');
      combobox4.Visible:=true;
      ComboBox4.Top:=Edit2.Top;
      ComboBox4.Left:=Edit2.Left;
      ComboBox4.Visible:=True;
      button2.Enabled:=true;
    end;
    17:
    begin
      edit1.Visible:=true;
      label3.Visible:=false;
      label4.Visible:=false;
      dtpk1.Visible:=false;
      dtpk2.Visible:=false;
      ComboBox2.Visible:=False;
      BitBtn5.Visible:=false;
    end;
    18:
    begin
      edit1.Visible:=true;
      label3.Visible:=false;
      label4.Visible:=false;
      dtpk1.Visible:=false;
      dtpk2.Visible:=false;
      ComboBox2.Visible:=False;
      BitBtn5.Visible:=false;
    end;
    19:
    begin
      radiogroup2.Visible:=false;
      BitBtn5.Visible:=false;
      ComboBox4.Items.Clear;
      ComboBox4.Items.Add('工序');
      ComboBox4.Items.Add('非工序');
      combobox4.Visible:=true;
      ComboBox4.Top:=Edit2.Top;
      ComboBox4.Left:=Edit2.Left;
      ComboBox4.Visible:=true;
      button2.Enabled:=true;
    end;
    20:
    begin
      radiogroup2.Visible:=false;
      BitBtn5.Visible:=false;
      ComboBox4.Items.Clear;
      ComboBox4.Items.Add('直接材料');
      ComboBox4.Items.Add('间接材料');
      combobox4.Visible:=true;
      ComboBox4.Top:=Edit2.Top;
      ComboBox4.Left:=Edit2.Left;
      ComboBox4.Visible:=true;
      button2.Enabled:=true;
    end;
  end;

end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
case listbox2.ItemIndex of
1:
 begin
  form_inv:=tform_inv.Create(application);
  form_inv.ADOQuery1.Close;
  form_inv.ADOQuery1.Parameters[1].Value:=trim(edit2.Text);
  form_inv.ADOQuery1.Open;  
  if form_inv.ShowModal=mrok then
   begin
    edit2.Text:=trim(form_inv.ADOQuery1INV_PART_NUMBER.Value);
    button2.Enabled:=true;
    button2.SetFocus;
   end
  else
   edit2.SetFocus;
  form_inv.free;
 end;
2:
 begin
  form_invtype:=tform_invtype.Create(application);
  if form_invtype.ShowModal=mrok then
   begin
    edit2.Text:=trim(form_invtype.ADOQuery1GROUP_NAME.Value);
    button2.Enabled:=true;
    button2.SetFocus;
   end
  else
   edit2.SetFocus;
  form_invtype.free;
 end;
4:
 begin
  form_dept:=tform_dept.Create(application);
  if form_dept.ShowModal=mrok then
   begin
    edit2.Text:=trim(form_dept.ADOQuery1dept_code.Value);
    button2.Enabled:=true;
    button2.SetFocus;
   end
  else
   edit2.SetFocus;
  form_dept.free;
 end;
6:
 begin
  form_invgroup:=tform_invgroup.Create(application);
  if form_invgroup.ShowModal=mrok then
   begin
    edit2.Text:=trim(form_invgroup.ADOQuery1inv_group_name.Value);
    button2.Enabled:=true;
    button2.SetFocus;
   end
  else
   edit2.SetFocus;
  form_invgroup.Free;
 end;
7:
 begin
  form_wh:=tform_wh.Create(application);
  if form_wh.ShowModal=mrok then
   begin
    edit2.Text:=trim(form_wh.ADOQuery1WAREHOUSE_CODE.Value);
    label_rkey15.Caption := form_wh.ADOQuery1RKEY.AsString;
    button2.Enabled:=true;
    button2.SetFocus;
   end
  else
   listbox2.SetFocus;
  form_wh.free;
 end;
9:
 begin
  form_supp:=tform_supp.Create(application);
  if form_supp.ShowModal=mrok then
   begin
    edit2.Text:=trim(form_supp.adoquery1code.Value);
    button2.Enabled:=true;
    button2.SetFocus;
   end
  else
   edit2.SetFocus;
  form_supp.free;
 end;
10:
 begin
  frmempl:=tfrmempl.Create(application);
  if frmempl.ShowModal=mrok then
   begin
    edit2.Text:=trim(frmempl.ADOQuery1empl_code.Value);
    button2.Enabled:=true;
    button2.SetFocus;
   end
  else
   edit2.SetFocus;
  frmempl.free;
 end;

11:
 begin
  Form_lo:=TForm_lo.Create(application);
  if Form_lo.ShowModal=mrok then
   begin
    edit2.Text:=trim(Form_lo.ADOQuery1CODE.Value);
    button2.Enabled:=true;
    button2.SetFocus;
   end
  else
   edit2.SetFocus;
  Form_lo.free;
 end;
16:
 begin
  form_wh:=tform_wh.Create(application);
  if form_wh.ShowModal=mrok then
   begin
    edit2.Text:=trim(form_wh.ADOQuery1WAREHOUSE_CODE.Value);
    label_rkey15.Caption := form_wh.ADOQuery1RKEY.AsString;
    button2.Enabled:=true;
    button2.SetFocus;
   end
  else
   listbox2.SetFocus;
  form_wh.free;
 end;
 end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i,j:byte;
  hasadded:boolean; //用于判断查询项目是否已添加
begin

  for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox2.Items[listbox2.itemindex]  then
  begin
    hasadded := True;
    j :=i;
    Break;
  end;

  if hasadded = False then
   begin
     j := sgrid1.RowCount -1 ;
     sgrid1.RowCount:=sgrid1.RowCount+1;
   end;

      sgrid1.Cells[0,j]:=listbox2.Items[listbox2.itemindex];
      sgrid1.Cells[1,j]:=edit2.Text;

  case listbox2.ItemIndex of
    0:
    case radiogroup2.ItemIndex of
      0:sgrid1.Cells[2,j]:='and Data0457.GON_NUMBER = '''+trim(edit2.Text)+'''';
      1:sgrid1.Cells[2,j]:='and Data0457.GON_NUMBER LIKE ''%'+trim(edit2.Text)+'%''';
    end;
    1:
    case radiogroup2.ItemIndex of
      0:sgrid1.Cells[2,j]:='and Data0017.INV_PART_NUMBER = '''+trim(edit2.Text)+'''';
      1:sgrid1.Cells[2,j]:='and Data0017.INV_PART_NUMBER LIKE ''%'+trim(edit2.Text)+'%''';
    end;
    2:
    case radiogroup2.ItemIndex of
      0:sgrid1.Cells[2,j]:='and Data0496.GROUP_NAME = '''+trim(edit2.Text)+'''';
      1:sgrid1.Cells[2,j]:='and Data0496.GROUP_NAME LIKE ''%'+trim(edit2.Text)+'%''';
    end;
    3:
    case radiogroup2.ItemIndex of
      0:sgrid1.Cells[2,j]:='and Data0468.CUT_NO = '''+trim(edit2.Text)+'''';
      1:sgrid1.Cells[2,j]:='and Data0468.CUT_NO LIKE ''%'+trim(edit2.Text)+'%''';
    end;
    4:
    case radiogroup2.ItemIndex of
      0:sgrid1.Cells[2,j]:='and Data0034.DEPT_code = '''+trim(edit2.Text)+'''';
      1:sgrid1.Cells[2,j]:='and Data0034.DEPT_code LIKE ''%'+trim(edit2.Text)+'%''';
    end;
    5:
     begin
      sgrid1.Cells[1,j]:='从'+datetostr(dtpk3.date)+'到'+datetostr(dtpk4.date);
      sgrid1.Cells[2,j]:=               //材料发放长日期格式
        'and  Data0207.TDATE>='''+datetostr(dtpk3.date)+
        formatdatetime(' hh:nn:ss',self.Dttm3.Time)+
        '''and Data0207.TDATE<='''+datetostr(dtpk4.date)+
        formatdatetime(' hh:nn:ss',self.Dttm4.Time)+'''';
       label19.Caption:=datetostr(dtpk3.date)+
        formatdatetime(' hh:nn:ss',self.Dttm3.Time);
       label20.Caption:=datetostr(dtpk4.date)+
        formatdatetime(' hh:nn:ss',self.Dttm4.Time);

     end;
    6:
    case radiogroup2.ItemIndex of
      0:sgrid1.Cells[2,j]:='and Data0019.inv_group_name = '''+trim(edit2.Text)+'''';
      1:sgrid1.Cells[2,j]:='and Data0019.inv_group_name LIKE ''%'+trim(edit2.Text)+'%''';
    end;
    7:
      sgrid1.Cells[2,j] := 'and data0457.warehouse_ptr='+label_rkey15.Caption;
    8:
    case radiogroup2.ItemIndex of
      0:sgrid1.Cells[2,j]:='and Data0457.ref_number = '''+trim(edit2.Text)+'''';
      1:sgrid1.Cells[2,j]:='and Data0457.ref_number LIKE ''%'+trim(edit2.Text)+'%''';
    end;
    9:
    case radiogroup2.ItemIndex of
      0:sgrid1.Cells[2,j] := 'and data0023.code = '''+trim(edit2.Text)+'''';
      1:sgrid1.Cells[2,j] := 'and data0023.code LIKE ''%'+trim(edit2.Text)+'%''';
    end;
    10:
    case radiogroup2.ItemIndex of
      0:sgrid1.Cells[2,j] := 'and data0005.empl_code = '''+trim(edit2.Text)+'''';
      1:sgrid1.Cells[2,j] := 'and data0005.empl_code LIKE ''%'+trim(edit2.Text)+'%''';
    end;
    11:
    case radiogroup2.ItemIndex of
      0:sgrid1.Cells[2,j] := 'and Data0016.CODE = '''+trim(edit2.Text)+'''';
      1:sgrid1.Cells[2,j] := 'and Data0016.CODE like ''%'+trim(edit2.Text)+'%''';
    end;
    12:
    case radiogroup2.ItemIndex of
      0:sgrid1.Cells[2,j] := 'and Data0456.GRN_NUMBER = '''+trim(edit2.Text)+'''';
      1:sgrid1.Cells[2,j] := 'and Data0456.GRN_NUMBER like ''%'+trim(edit2.Text)+'%''';
    end;
    13:
    case radiogroup2.ItemIndex of
      0:sgrid1.Cells[2,j] := 'and Data0268.CUT_NO = '''+trim(edit2.Text)+'''';
      1:sgrid1.Cells[2,j] := 'and Data0268.CUT_NO like ''%'+trim(edit2.Text)+'%''';
    end;
    14:
    begin
      sgrid1.Cells[1,j]:=RadioGroup2.Items[ radiogroup2.ItemIndex]+edit2.Text;
      case radiogroup2.ItemIndex of
       0: sgrid1.Cells[2,j] := 'and Data0022.tax_price = '+edit2.Text;
       1: sgrid1.Cells[2,j] := 'and Data0022.tax_price > '+edit2.Text;
       2: sgrid1.Cells[2,j] := 'and Data0022.tax_price < '+edit2.Text;
      end;
    end;
    15:
    begin
      sgrid1.Cells[1,j]:=ComboBox4.Text;

      if ComboBox4.ItemIndex=0 then
        sgrid1.Cells[2,j]:='and data0456.ttype = 1'
      else
      if ComboBox4.ItemIndex=1 then
        sgrid1.Cells[2,j]:='and data0456.ttype =3'
      else
      if ComboBox4.ItemIndex=2 then
        sgrid1.Cells[2,j]:='and data0456.ttype =4'
      else
        sgrid1.Cells[2,j]:='and data0456.ttype = 5';
    end;
    16:
      sgrid1.Cells[2,j] := 'and data0456.warehouse_ptr='+label_rkey15.Caption;
    17:
    case radiogroup2.ItemIndex of
      0:sgrid1.Cells[2,j] := 'and Data0017.INV_NAME = '''+trim(edit2.Text)+'''';
      1:sgrid1.Cells[2,j] := 'and Data0017.INV_NAME like ''%'+trim(edit2.Text)+'%''';
    end;
    18:
    case radiogroup2.ItemIndex of
      0:sgrid1.Cells[2,j] := 'and Data0017.INV_DESCRIPTION = '''+trim(edit2.Text)+'''';
      1:sgrid1.Cells[2,j] := 'and Data0017.INV_DESCRIPTION like ''%'+trim(edit2.Text)+'%''';
    end;
    19:
     begin
      sgrid1.Cells[1,j]:=ComboBox4.Text;

      if ComboBox4.ItemIndex=0 then
        sgrid1.Cells[2,j]:='and data0034.ttype = 1'
      else
        sgrid1.Cells[2,j]:='and data0034.ttype <> 1';
     end;
    20:
     begin
      sgrid1.Cells[1,j]:=ComboBox4.Text;

      if ComboBox4.ItemIndex=0 then
        sgrid1.Cells[2,j]:='and data0496.ttype = ''p'''
      else
        sgrid1.Cells[2,j]:='and data0496.ttype <> ''p''';
     end;
  end;

end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if listbox1.ItemIndex=8 then
if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
 abort
else
 if key = chr(46) then      //判断是否重复输入小数点'.'
  if pos('.',edit1.Text)>0
   then abort;
end;

procedure TForm1.Edit3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit3.Text)<>'' then
 button3.Enabled:=true
else
 button3.Enabled:=false;
end;

procedure TForm1.ListBox3Click(Sender: TObject);
begin

 label9.Caption:=listbox3.Items[listbox3.itemindex];
 label7.Visible:=false;
 label8.Visible:=false;
 dtpk5.Visible:=false;
 dtpk6.Visible:=false;
 edit3.Text:='';
 edit3.Visible:=true;
 bitbtn6.Visible:=true;
 button3.Enabled:=false;
 checkbox1.Visible:=false;
case listbox3.ItemIndex of
 0:;
 1:;
 2:;
 3:;
 4:
 begin
  label7.Visible:=true;
  label8.Visible:=true;
  dtpk5.Visible:=true;
  dtpk6.Visible:=true;
  edit3.Visible:=false;
  bitbtn6.Visible:=false;
  button3.Enabled:=true;
 end;
 5:;
 6:;
 7:bitbtn6.Visible:=false;
 8:
 begin
  bitbtn6.Visible:=false;
  edit3.Visible:=false;
  button3.Enabled:=true;
  checkbox1.Visible:=true;
 end;
end;

end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
case listbox3.ItemIndex of
0:
 begin
  form_inv:=tform_inv.Create(application);
  form_inv.ADOQuery1.Close;
  form_inv.ADOQuery1.Parameters[1].Value:=trim(edit3.Text);
  form_inv.ADOQuery1.Open;  
  if form_inv.ShowModal=mrok then
   begin
    edit3.Text:=trim(form_inv.ADOQuery1INV_PART_NUMBER.Value);
    button3.Enabled:=true;
    button3.SetFocus;
   end
  else
   edit3.SetFocus;
  form_inv.free;
 end;
1:
 begin
  form_invtype:=tform_invtype.Create(application);
  if form_invtype.ShowModal=mrok then
   begin
    edit3.Text:=trim(form_invtype.ADOQuery1GROUP_NAME.Value);
    button3.Enabled:=true;
    button3.SetFocus;
   end
  else
   edit3.SetFocus;
  form_invtype.free;
 end;
2:
 begin
  form_wh:=tform_wh.Create(application);
  if form_wh.ShowModal=mrok then
   begin
    edit3.Text:=trim(form_wh.ADOQuery1WAREHOUSE_CODE.Value);
    button3.Enabled:=true;
    button3.SetFocus;
   end
  else
   edit3.SetFocus;
  form_wh.free;
 end;
3:
 begin
  form_lo:=tform_lo.Create(application);
  if form_lo.ShowModal=mrok then
   begin
    edit3.Text:=trim(form_lo.ADOQuery1.FieldValues['code']);
    button3.Enabled:=true;
    button3.SetFocus;
   end
  else
   edit3.SetFocus;
  form_lo.free;
 end;
5:
 begin
  form_supp:=tform_supp.Create(application);
  if form_supp.ShowModal=mrok then
   begin
    edit3.Text:=trim(form_supp.adoquery1code.Value);
    button3.Enabled:=true;
    button3.SetFocus;
   end
  else
   edit3.SetFocus;
  form_supp.free;
 end;
6:
 begin
  form_invgroup:=tform_invgroup.Create(application);
  if form_invgroup.ShowModal=mrok then
   begin
    edit3.Text:=trim(form_invgroup.ADOQuery1inv_group_name.Value);
    button3.Enabled:=true;
    button3.SetFocus;
   end
  else
   edit3.SetFocus;
  form_invgroup.Free;
 end;
end;

end;

procedure TForm1.Button3Click(Sender: TObject);
var
   i,j:byte;
   hasadded:boolean; //用于判断查询项目是否已添加
begin
   for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex]  then
   begin
     hasadded := True;
     j := i;
     Break;
   end;

   if  hasadded =False then
   begin
     j := sgrid1.RowCount-1;
     sgrid1.RowCount:=sgrid1.RowCount+1;
   end;

      sgrid1.Cells[0,j]:=listbox3.Items[listbox3.itemindex];
      sgrid1.Cells[1,j]:=edit3.Text;
     case listbox3.ItemIndex of
     0:
       sgrid1.Cells[2,j]:='and Data0017.INV_PART_NUMBER LIKE ''%'+trim(edit3.Text)+'%''';
     1:
       sgrid1.Cells[2,j]:='and Data0496.GROUP_NAME LIKE '''+trim(edit3.Text)+'%''';
     2:
       sgrid1.Cells[2,j]:='and Data0015.warehouse_code LIKE '''+trim(edit3.Text)+'%''';
     3:
       sgrid1.Cells[2,j]:='and Data0016.code LIKE '''+trim(edit3.Text)+'%''';
     4:
       begin
        sgrid1.Cells[1,j]:='从'+datetostr(dtpk5.date)+'到'+datetostr(dtpk6.date);
        sgrid1.Cells[2,j]:=
        'and  Data0022.expire_date>='''+datetostr(dtpk5.date)+'''and Data0022.expire_date<='''+datetostr(dtpk6.date)+'''';
       end;
     5:
      sgrid1.Cells[2,j]:='and data0023.code LIKE '''+trim(edit3.Text)+'%''';
     6:
      sgrid1.Cells[2,j]:='and data0019.inv_group_name LIKE '''+trim(edit3.Text)+'%''';
     7:
      sgrid1.Cells[2,j]:='and Data0017.INV_PART_description LIKE ''%'+trim(edit3.Text)+'%''';
     8:
        begin
        if checkbox1.Checked then
          begin
            sgrid1.Cells[1,j]:='是';
            sgrid1.Cells[2,j]:='and data0017.CONSIGN_ONHAND_QTY > data0017.QUAN_ON_HAND';
          end
        else
          begin
            sgrid1.Cells[1,j]:='否';
            sgrid1.Cells[2,j]:='and data0017.CONSIGN_ONHAND_QTY <= data0017.QUAN_ON_HAND';
          end;
        end;
     end;

end;

procedure TForm1.ListBox4Click(Sender: TObject);
begin
 edit4.Text:='';
 edit4.Visible:=true;
 button4.Enabled:=false;
 bitbtn7.Visible:=true;
 label10.Visible:=false;
 label11.Visible:=false;
 dtpk7.Visible:=false;
 dtpk8.Visible:=false;
 rgp3.Visible:=false;
 label12.Caption:=listbox4.Items[listbox4.itemindex];
 case listbox4.ItemIndex of
 0:;
 1:
 begin
  label10.Visible:=true;
  label11.Visible:=true;
  dtpk7.Visible:=true;
  dtpk8.Visible:=true;
  edit4.Visible:=false;
  bitbtn7.Visible:=false;
  button4.Enabled:=true;
 end;
 2:
  begin
   rgp3.Visible:=true;
   bitbtn7.Visible:=false;
  end;
 3:;
 4:begin
    bitbtn7.Visible:=false;
   end;
 5:;
 6:;
 7:;
 8:;
 end;
end;

procedure TForm1.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
if listbox4.ItemIndex=2 then
if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
 abort
else
 if key = chr(46) then      //判断是否重复输入小数点'.'
  if pos('.',edit4.Text)>0
   then abort;
end;

procedure TForm1.Edit4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit4.Text)<>'' then
 button4.Enabled:=true
else
 button4.Enabled:=false;
end;

procedure TForm1.BitBtn7Click(Sender: TObject);
begin
case listbox4.ItemIndex of
0:
 try
  frmempl:=tfrmempl.Create(application);
  if frmempl.ShowModal=mrok then
   begin
    edit4.Text:=frmempl.ADOQuery1employee_name.Value;
    button4.Enabled:=true;
    button4.SetFocus;
   end
  else
   edit4.SetFocus;
 finally
  frmempl.free;
 end;
 3:
 begin
  form_inv:=tform_inv.Create(application);
  form_inv.ADOQuery1.Close;
  form_inv.ADOQuery1.Parameters[1].Value:=trim(edit1.Text);
  form_inv.ADOQuery1.Open;  
  if form_inv.ShowModal=mrok then
   begin
    edit4.Text:=trim(form_inv.ADOQuery1INV_PART_NUMBER.Value);
    button4.Enabled:=true;
    button4.SetFocus;
   end
  else
   edit4.SetFocus;
  form_inv.free;
 end;
 5,6:
 begin
  form_wh:=tform_wh.Create(application);
  if form_wh.ShowModal=mrok then
   begin
    edit4.Text:=trim(form_wh.ADOQuery1WAREHOUSE_CODE.Value);
    button4.Enabled:=true;
    button4.SetFocus;
   end
  else
   edit4.SetFocus;
  form_wh.free;
 end;
 7,8 :
 try
  Form_lo:=tForm_lo.Create(application);
  if Form_lo.ShowModal=mrok then
  begin
   edit4.Text:=trim(Form_lo.ADOQuery1code.Value);
   button4.Enabled:=true;
   button4.SetFocus;
  end
  else
  edit4.SetFocus;
 finally
  Form_lo.Free;
 end;
end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
   i,j:byte;
   hasadded:boolean; //用于判断查询项目是否已添加
begin

   for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i] = listbox4.Items[listbox4.itemindex] then
   begin
      hasadded := True;
      j := i;
      Break;
   end;

  if  hasadded =False then
   begin
     j := sgrid1.RowCount-1;
     sgrid1.RowCount:=sgrid1.RowCount+1;
   end;

      sgrid1.Cells[0,j]:=listbox4.Items[listbox4.itemindex];
     sgrid1.Cells[1,j]:=edit4.Text;
     case listbox4.ItemIndex of
      0: sgrid1.Cells[2,j]:='and Data0005.employee_name LIKE '''+trim(edit4.Text)+'%''';
      1:
        begin
         sgrid1.Cells[1,j]:='从'+datetostr(dtpk7.date)+'到'+datetostr(dtpk8.date);
         sgrid1.Cells[2,j]:=
         'and  Data0027.TDATE>='''+datetostr(dtpk7.date)+''' and Data0027.TDATE<='''+datetostr(dtpk8.date+1)+'''';
         end;
      2:
       case rgp3.ItemIndex of
          0:sgrid1.Cells[2,j]:='and Data0027.quantity >'+trim(edit4.Text)+'';
          1:sgrid1.Cells[2,j]:='and Data0027.quantity ='+trim(edit4.Text)+'';
          2:sgrid1.Cells[2,j]:='and Data0027.quantity <'+trim(edit4.Text)+'';
       end;
       3:sgrid1.Cells[2,j]:='and Data0017.inv_part_number LIKE '''+trim(edit4.Text)+'%''';
       4:sgrid1.Cells[2,j]:='and Data0022.barcode_id LIKE '''+trim(edit4.Text)+'%''';
       5:sgrid1.Cells[2,j]:='and Data0015.warehouse_code LIKE '''+trim(edit4.Text)+'%''';
       6:sgrid1.Cells[2,j]:='and Data0015_1.warehouse_code LIKE '''+trim(edit4.Text)+'%''';
       7:sgrid1.Cells[2,j]:='and Data0016.code LIKE '''+trim(edit4.Text)+'%''';
       8:sgrid1.Cells[2,j]:='and Data0016_1.code LIKE '''+trim(edit4.Text)+'%''';
     end;

end;

procedure TForm1.RGp4Click(Sender: TObject);
begin
bitbtn2click(sender);
if radiogroup1.ItemIndex=0 then//接收
 if rgp4.ItemIndex=0 then     //接收明细
  begin
   groupbox1.Visible:=true;
   groupbox5.Visible:=false;
  end
 else                        //接收汇总
  begin
   groupbox1.Visible:=false;
   groupbox5.Visible:=true;
   listbox5.Selected[0]:=true;
   listbox5click(sender);
  end
else
 if radiogroup1.ItemIndex=1 then //发放
  if rgp4.ItemIndex=0 then //发放明细
  begin
   groupbox2.Visible:=true;
   groupbox6.Visible:=false;
  end
  else                 //发放汇总
  begin
   groupbox2.Visible:=false;
   groupbox6.Visible:=true;
   listbox6.Selected[0]:=true;
   listbox6click(sender);
  end
 else  //库存
  if radiogroup1.ItemIndex=2 then //发放
  if rgp4.ItemIndex=0 then
  begin
   groupbox7.Visible:=true;
   groupbox3.Visible:=false;
  end
  else
  begin
   groupbox7.Visible:=false;
   groupbox3.Visible:=true;
   listbox3.Selected[0]:=true;
   listbox3click(sender);
  end
end;

procedure TForm1.ListBox5Click(Sender: TObject);
begin
  label15.Caption:=listbox5.Items[listbox5.itemindex];
  edit5.Text:='';
  edit5.Visible:=true;
  edit5.Enabled:=true;
  button5.Enabled:=false;
  bitbtn8.Visible:=true;
  label13.Visible:=false;
  label14.Visible:=false;
  dtpk9.Visible:=false;
  dtpk10.Visible:=false;
  dttm9.Visible:=false;
  dttm10.Visible:=false;
  ComboBox3.Visible:=False;
  case listbox5.ItemIndex of
    0:
    begin

    end;
    1:
    begin

    end;
    2:
    begin
      edit5.Visible:=false;
      button5.Enabled:=true;
      bitbtn8.Visible:=false;
      label13.Visible:=true;
      label14.Visible:=true;
      dtpk9.Visible:=true;
      dtpk10.Visible:=true;
      dttm9.Visible:=true;
      dttm10.Visible:=true;
    end;
    3:
    begin

    end;
    4:;
    5,7:edit5.Enabled:=false;
    6:
    begin
      edit5.Visible:=false;
      button5.Enabled:=false;
      bitbtn8.Visible:=false;
      label13.Visible:=false;
      label14.Visible:=false;
      dtpk9.Visible:=false;
      dtpk10.Visible:=false;
      dttm9.Visible:=false;
      dttm10.Visible:=false;
      ComboBox3.Top:=Edit5.Top;
      ComboBox3.Left:=Edit5.Left;
      ComboBox3.Visible:=True;
      Button5.Enabled:=True;
    end;
  end;

end;

procedure TForm1.Edit5KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit5.Text)<>'' then
 button5.Enabled:=true
else
 button5.Enabled:=false;
end;

procedure TForm1.BitBtn8Click(Sender: TObject);
begin
case listbox5.ItemIndex of
0:
 begin
  form_inv:=tform_inv.Create(application);
  form_inv.ADOQuery1.Close;
  form_inv.ADOQuery1.Parameters[1].Value:=trim(edit5.Text);
  form_inv.ADOQuery1.Open;  
  if form_inv.ShowModal=mrok then
   begin
    edit5.Text:=trim(form_inv.ADOQuery1INV_PART_NUMBER.Value);
    button5.Enabled:=true;
    button5.SetFocus;
   end
  else
   edit5.SetFocus;
  form_inv.free;
 end;
1:
 begin
  form_invtype:=tform_invtype.Create(application);
  if form_invtype.ShowModal=mrok then
   begin
    edit5.Text:=trim(form_invtype.ADOQuery1GROUP_NAME.Value);
    button5.Enabled:=true;
    button5.SetFocus;
   end
  else
   edit5.SetFocus;
  form_invtype.free;
 end;
3:
 begin
  form_supp:=tform_supp.Create(application);
  if form_supp.ShowModal=mrok then
   begin
    edit5.Text:=trim(form_supp.adoquery1code.Value);
    button5.Enabled:=true;
    button5.SetFocus;
   end
  else
   edit5.SetFocus;
  form_supp.free;
 end;
4:
 begin
  form_invgroup:=tform_invgroup.Create(application);
  if form_invgroup.ShowModal=mrok then
   begin
    edit5.Text:=trim(form_invgroup.ADOQuery1inv_group_name.Value);
    button5.Enabled:=true;
    button5.SetFocus;
   end
  else
   edit5.SetFocus;
  form_invgroup.Free;
 end;
5:
 begin
  form_wh:=tform_wh.Create(application);
  if form_wh.ShowModal=mrok then
   begin
    edit5.Text:=trim(form_wh.ADOQuery1WAREHOUSE_CODE.Value);
    label_rkey15.Caption := form_wh.ADOQuery1RKEY.AsString;
    button5.Enabled:=true;
    button5.SetFocus;
   end
  else
   listbox5.SetFocus;
  form_wh.free;
 end;
 7:
 begin
  form_lo:=tform_lo.Create(application);
  if form_lo.ShowModal=mrok then
   begin
    edit5.Text:=trim(form_lo.ADOQuery1.FieldValues['code']);
    Edit5.Tag := form_lo.ADOQuery1RKEY.Value;
    button5.Enabled:=true;
    button5.SetFocus;
   end
  else
   edit5.SetFocus;
  form_lo.free;
 end;
end;
end;

procedure TForm1.Button5Click(Sender: TObject);//材料汇总
var
    i,j:byte;
    hasadded:boolean; //用于判断查询项目是否已添加
begin
 for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox5.Items[listbox5.itemindex]  then
  begin
    hasadded := True;
    j := i;
    Break;
  end;

  if hasadded =False then
   begin
     j := sgrid1.RowCount-1;
     sgrid1.RowCount:=sgrid1.RowCount+1;
   end;

       sgrid1.Cells[0,j]:=listbox5.Items[listbox5.itemindex];
      sgrid1.Cells[1,j]:=edit5.Text;
    case listbox5.ItemIndex of
    0:
    sgrid1.Cells[2,j] := 'and Data0017.INV_PART_NUMBER LIKE '''+edit5.Text+'%''';
    1:
    sgrid1.Cells[2,j] := 'and Data0496.GROUP_NAME LIKE '''+edit5.Text+'%''';
    2:
    begin
      sgrid1.Cells[1,j] := '从'+datetostr(dtpk9.date)+'到'+datetostr(dtpk10.date);
      sgrid1.Cells[2,j] :=                  //材料接收日期为长格式
      'and  data0456.ship_date >= '''+datetostr(dtpk9.date)+
      formatdatetime(' hh:nn:ss',self.Dttm9.Time)+
      ''' and data0456.ship_date <= '''+datetostr(dtpk10.date)+
      formatdatetime(' hh:nn:ss',self.Dttm10.Time)+'''';
    end;
    3:
    sgrid1.Cells[2,j] := 'and data0023.code LIKE '''+edit5.Text+'%''';
    4:
    sgrid1.Cells[2,j] := 'and data0019.inv_group_name LIKE '''+trim(edit5.Text)+'%''';
    5:
    sgrid1.Cells[2,j] := 'and data0456.warehouse_ptr='+label_rkey15.Caption;
    6:
     begin
      sgrid1.Cells[1,j]:=ComboBox3.Text;

      if ComboBox3.ItemIndex=0 then
        sgrid1.Cells[2,j]:='and data0456.ttype = 1'
      else
      if ComboBox3.ItemIndex=1 then
        sgrid1.Cells[2,j]:='and data0456.ttype =3'
      else
      if ComboBox3.ItemIndex=2 then
        sgrid1.Cells[2,j]:='and data0456.ttype =4'
      else
        sgrid1.Cells[2,j]:='and data0456.ttype = 5';
     end;
    7:sgrid1.Cells[2,j] := 'and data0022.LOCATION_PTR='+inttostr(Edit5.Tag);
    end;

end;

procedure TForm1.Edit6KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit6.Text)<>'' then
 button6.Enabled:=true
else
 button6.Enabled:=false;
end;

procedure TForm1.ListBox6Click(Sender: TObject);
begin
  label18.Caption:=listbox6.Items[listbox6.itemindex];
  edit6.Text:='';
  edit6.Visible:=true;
  edit6.Enabled:=true;
  button6.Enabled:=false;
  bitbtn9.Visible:=true;
  label16.Visible:=false;
  label17.Visible:=false;
  dtpk11.Visible:=false;
  dtpk12.Visible:=false;
  dttm11.Visible:=false;
  dttm12.Visible:=false;
  ComboBox5.Visible:=false;

  case listbox6.ItemIndex of
    0:
    begin

    end;
    1:
    begin

    end;
    2:
    begin
      edit6.Visible:=false;
      button6.Enabled:=true;
      bitbtn9.Visible:=false;
      label16.Visible:=true;
      label17.Visible:=true;
      dtpk11.Visible:=true;
      dtpk12.Visible:=true;
      dttm11.Visible:=true;
      dttm12.Visible:=true;
    end;
    3:
    begin

    end;
    4:;
    5,10:edit6.Enabled:=false;
    6:edit6.Enabled:=false;
    7,9:bitbtn9.Visible:=false;
    8:
    begin
      edit6.Enabled:=false;
      bitbtn9.Visible:=false;
      ComboBox5.Top:=Edit6.Top;
      ComboBox5.Left:=Edit6.Left;
      ComboBox5.Visible:=True;
      Button6.Enabled:=True;
    end;

  end;

end;

procedure TForm1.BitBtn9Click(Sender: TObject);
begin
case listbox6.ItemIndex of
0:
 begin
  form_inv:=tform_inv.Create(application);
  form_inv.ADOQuery1.Close;
  form_inv.ADOQuery1.Parameters[1].Value:=trim(edit6.Text);
  form_inv.ADOQuery1.Open;  
  if form_inv.ShowModal=mrok then
   begin
    edit6.Text:=trim(form_inv.ADOQuery1INV_PART_NUMBER.Value);
    button6.Enabled:=true;
    button6.SetFocus;
   end
  else
   edit6.SetFocus;
  form_inv.free;
 end;
1:
 begin
  form_invtype:=tform_invtype.Create(application);
  if form_invtype.ShowModal=mrok then
   begin
    edit6.Text:=trim(form_invtype.ADOQuery1GROUP_NAME.Value);
    button6.Enabled:=true;
    button6.SetFocus;
   end
  else
   edit6.SetFocus;
  form_invtype.free;
 end;
3:
 begin
  form_supp:=tform_supp.Create(application);
  if form_supp.ShowModal=mrok then
   begin
    edit6.Text:=trim(form_supp.adoquery1code.Value);
    button6.Enabled:=true;
    button6.SetFocus;
   end
  else
   edit6.SetFocus;
  form_supp.free;
 end;
4:
 begin
  form_invgroup:=tform_invgroup.Create(application);
  if form_invgroup.ShowModal=mrok then
   begin
    edit6.Text:=trim(form_invgroup.ADOQuery1inv_group_name.Value);
    button6.Enabled:=true;
    button6.SetFocus;
   end
  else
   edit6.SetFocus;
  form_invgroup.Free;
 end;
5:
 begin
  form_wh:=tform_wh.Create(application);
  if form_wh.ShowModal=mrok then
   begin
    edit6.Text:=trim(form_wh.ADOQuery1WAREHOUSE_CODE.Value);
    label_rkey15.Caption := form_wh.ADOQuery1RKEY.AsString;
    button6.Enabled:=true;
    button6.SetFocus;
   end
  else
   listbox6.SetFocus;
  form_wh.free;
 end;
6:
 begin
  form_dept:=tform_dept.Create(application);
  if form_dept.ShowModal=mrok then
   begin
    edit6.Text:=trim(form_dept.ADOQuery1dept_code.Value);
    dept_ptr:=form_dept.ADOQuery1rkey.Value;
    button6.Enabled:=true;
    button6.SetFocus;
   end
  else
   listbox6.SetFocus;
  form_dept.free;
 end;

 10:
 begin
  form_lo:=tform_lo.Create(application);
  if form_lo.ShowModal=mrok then
   begin
    edit6.Text:=trim(form_lo.ADOQuery1.FieldValues['code']);
    Edit6.Tag := form_lo.ADOQuery1RKEY.Value;
    button6.Enabled:=true;
    button6.SetFocus;
   end
  else
   edit6.SetFocus;
  form_lo.free;
 end;

end;

end;

procedure TForm1.Button6Click(Sender: TObject);
var
   i,j:byte;
   hasadded:boolean; //用于判断查询项目是否已添加
begin

  for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox6.Items[listbox6.itemindex]  then
  begin
    hasadded := True;
    j := i;
    Break;
  end;

  if hasadded =False then
   begin
     j := sgrid1.RowCount-1;
     sgrid1.RowCount:=sgrid1.RowCount+1;
   end;

      sgrid1.Cells[0,j]:=listbox6.Items[listbox6.itemindex];
      sgrid1.Cells[1,j]:=edit6.Text;
  case listbox6.ItemIndex of
    0:
    sgrid1.Cells[2,j] := 'and Data0017.INV_PART_NUMBER LIKE '''+edit6.Text+'%''';
    1:
    sgrid1.Cells[2,j] := 'and Data0496.GROUP_NAME LIKE '''+edit6.Text+'%''';
    2:
    begin
      sgrid1.Cells[1,j] := '从'+datetostr(dtpk11.date)+'到'+datetostr(dtpk12.date);
      sgrid1.Cells[2,j] := //材料接收日期为长格式
      'and Data0207.TDATE >= '''+datetostr(dtpk11.date)+
      formatdatetime(' hh:nn:ss',self.Dttm11.Time)+
      '''and Data0207.TDATE <= '''+datetostr(dtpk12.date)+
      formatdatetime(' hh:nn:ss',self.Dttm12.Time)+'''';
    end;
    3:
    sgrid1.Cells[2,j] := 'and data0023.code LIKE '''+edit6.Text+'%''';
    4:
    sgrid1.Cells[2,j] := 'and data0019.inv_group_name LIKE '''+trim(edit6.Text)+'%''';
    5:
    sgrid1.Cells[2,j] := 'and data0457.WareHOUSE_PTR='+label_rkey15.Caption;
    6:
    sgrid1.Cells[2,j] := 'and data0457.dept_PTR='+inttostr(dept_ptr);
    7:sgrid1.Cells[2,j] := 'and Data0268.CUT_NO like ''%'+trim(edit6.Text)+'%''';
    8:
     begin
      sgrid1.Cells[1,j]:=ComboBox5.Text;
      if ComboBox5.ItemIndex=0 then
        sgrid1.Cells[2,j]:='and data0456.ttype = 1'
      else
      if ComboBox5.ItemIndex=1 then
        sgrid1.Cells[2,j]:='and data0456.ttype =3'
      else
      if ComboBox5.ItemIndex=2 then
        sgrid1.Cells[2,j]:='and data0456.ttype =4'
      else
        sgrid1.Cells[2,j]:='and data0456.ttype = 5';
     end;
     9:sgrid1.Cells[2,j] := 'and Data0457.REF_NUMBER like ''%'+trim(edit6.Text)+'%''';
     10:sgrid1.Cells[2,j] := 'and data0022.LOCATION_PTR='+inttostr(Edit6.Tag);
  end;

end;

procedure TForm1.BitBtn10Click(Sender: TObject);
begin
 form1.Hide;
 form_date:=tform_date.Create(application);
 form_date.ShowModal;
 form_date.Free;
end;

procedure TForm1.ListBox7Click(Sender: TObject);
begin
label21.Caption:=listbox7.Items[listbox7.itemindex];
edit7.Text:='';
button7.Enabled:=false;
bitbtn11.Visible:=true;
combobox1.Visible:=false;
RADIOGROUP4.Visible:=TRUE;
edit7.Visible:=true;
RadioGroup4.Items.Clear;
RadioGroup4.Items.Add('等于 =');
RadioGroup4.Items.Add('相似 Like');
RadioGroup4.ItemIndex:=0;
case listbox7.ItemIndex of
0:
 begin

 end;
1:
 begin
  bitbtn11.Visible:=false;
 end;
2:
 begin

 end;
3:
 begin

 end;
4:;
5:;
6:bitbtn11.Visible:=false;
7:
 begin
   bitbtn11.Visible:=false;
   edit7.Visible:=false;
   button7.Enabled:=true;
   ComboBox1.Items.Clear;
   ComboBox1.Items.Add('有效');
   ComboBox1.Items.Add('已过期');
   combobox1.Visible:=true;
   combobox1.ItemIndex:=0;
   RADIOGROUP4.Visible:=False;
 end;
8:
 begin
   BitBtn11.Visible:=false;
   RadioGroup4.Items.Clear;
   RadioGroup4.Items.Add('等于 =');
   RadioGroup4.Items.Add('大于 >');
   RadioGroup4.Items.Add('小于 <');
   RadioGroup4.ItemIndex:=1;
 end;
9:
 begin
   bitbtn11.Visible:=false;
   edit7.Visible:=false;
   button7.Enabled:=true;
   ComboBox1.Items.Clear;
   ComboBox1.Items.Add('编码入库');
   ComboBox1.Items.Add('直接入库');   
   ComboBox1.Items.Add('调拨入库');
   ComboBox1.Items.Add('VMI入库');
   combobox1.Visible:=true;
   combobox1.ItemIndex:=0;
   RADIOGROUP4.Visible:=False;  
 end;

end;
end;

procedure TForm1.Edit7Change(Sender: TObject);
begin
if trim(edit7.Text)<>'' then
 button7.Enabled := true
else
 button7.Enabled := false;
end;

procedure TForm1.BitBtn11Click(Sender: TObject);
begin
case listbox7.ItemIndex of
0:
 begin
  form_inv:=tform_inv.Create(application);
  form_inv.ADOQuery1.Close;
  form_inv.ADOQuery1.Parameters[1].Value:=trim(edit7.Text);
  form_inv.ADOQuery1.Open;  
  if form_inv.ShowModal=mrok then
   begin
    edit7.Text:=trim(form_inv.ADOQuery1INV_PART_NUMBER.Value);
    button7.SetFocus;
   end
  else
   edit7.SetFocus;
  form_inv.free;
 end;
1:;
2:
 begin
  form_invtype:=tform_invtype.Create(application);
  if form_invtype.ShowModal=mrok then
   begin
    edit7.Text:=trim(form_invtype.ADOQuery1GROUP_NAME.Value);
    button7.SetFocus;
   end
  else
   edit7.SetFocus;
  form_invtype.free;
 end;
3:
 begin
  form_supp:=tform_supp.Create(application);
  if form_supp.ShowModal=mrok then
   begin
    edit7.Text:=trim(form_supp.adoquery1code.Value);
    button7.SetFocus;
   end
  else
   edit7.SetFocus;
  form_supp.free;
 end;

4:
 begin
  form_wh:=tform_wh.Create(application);
  if form_wh.ShowModal=mrok then
   begin
    edit7.Text:=trim(form_wh.ADOQuery1WAREHOUSE_CODE.Value);
    button7.SetFocus;
   end
  else
   edit7.SetFocus;
  form_wh.free;
 end;

5:
 begin
  form_lo:=tform_lo.Create(application);
  if form_lo.ShowModal=mrok then
   begin
    edit7.Text:=trim(form_lo.ADOQuery1.FieldValues['code']);
    button7.SetFocus;
   end
  else
   edit7.SetFocus;
  form_lo.free;
 end;
10:
 begin
  form_invgroup:=tform_invgroup.Create(application);
  if form_invgroup.ShowModal=mrok then
   begin
    edit7.Text:=trim(form_invgroup.ADOQuery1inv_group_name.Value);
    button7.SetFocus;
   end
  else
   edit7.SetFocus;
  form_invgroup.free;
 end;
end;

end;

procedure TForm1.Button7Click(Sender: TObject);
var
   i,j:byte;
   hasadded:boolean; //用于判断查询项目是否已添加
begin
    for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox7.Items[listbox7.itemindex]  then
   begin
     hasadded := True;
     j := i;
     Break;
   end;

  if hasadded =False then
   begin
     j := sgrid1.RowCount-1;
     sgrid1.RowCount:=sgrid1.RowCount+1;
   end;


  sgrid1.Cells[0,j]:=label21.Caption;
 if listbox7.ItemIndex = 7 then
   sgrid1.Cells[1,j]:=combobox1.Text
 else
   sgrid1.Cells[1,j]:=edit7.Text;

 case listbox7.ItemIndex of
 0:
   case radiogroup4.ItemIndex of
   0:sgrid1.Cells[2,j] := 'and Data0017.INV_PART_NUMBER = '''+edit7.Text+'''';
   1:sgrid1.Cells[2,j] := 'and Data0017.INV_PART_NUMBER LIKE ''%'+edit7.Text+'%''';
   end;
 1:
   case radiogroup4.ItemIndex of
   0:sgrid1.Cells[2,j] := 'and Data0017.INV_NAME = '''+edit7.Text+'''';
   1:sgrid1.Cells[2,j] := 'and Data0017.INV_NAME LIKE ''%'+edit7.Text+'%''';
   end;
 2:
   case radiogroup4.ItemIndex of
   0:sgrid1.Cells[2,j] := 'and Data0496.GROUP_NAME = '''+edit7.Text+'''';
   1:sgrid1.Cells[2,j] := 'and Data0496.GROUP_NAME LIKE '''+edit7.Text+'%''';
   end;
 3:
   case radiogroup4.ItemIndex of
   0:sgrid1.Cells[2,j] := 'and data0023.code = '''+edit7.Text+'''';
   1:sgrid1.Cells[2,j] := 'and data0023.code LIKE ''%'+edit7.Text+'%''';
   end;
 4:
   case radiogroup4.ItemIndex of
   0:sgrid1.Cells[2,j] := 'and data0015.WAREHOUSE_CODE = '''+trim(edit7.Text)+'''';
   1:sgrid1.Cells[2,j] := 'and data0015.WAREHOUSE_CODE LIKE ''%'+trim(edit7.Text)+'%''';
   end;
 5:
   case radiogroup4.ItemIndex of
   0:sgrid1.Cells[2,j] := 'and data0016.CODE = '''+trim(edit7.Text)+'''';
   1:sgrid1.Cells[2,j] := 'and data0016.CODE LIKE ''%'+trim(edit7.Text)+'%''';
   end;
 6:
   case radiogroup4.ItemIndex of
    0:sgrid1.Cells[2,j] := 'and Data0017.INV_DESCRIPTION = '''+trim(edit7.Text)+'''';
    1:sgrid1.Cells[2,j] := 'and Data0017.INV_DESCRIPTION LIKE ''%'+trim(edit7.Text)+'%''';
   end;
 7:
  case combobox1.ItemIndex of
   0: sgrid1.Cells[2,j] := 'and DATEDIFF(day, GETDATE(), dbo.Data0022.EXPIRE_DATE)>= 0';
   1: sgrid1.Cells[2,j] := 'and DATEDIFF(day, GETDATE(), dbo.Data0022.EXPIRE_DATE)< 0';
  end;
 8:
  begin
   sgrid1.Cells[1,j]:=RadioGroup4.Items[radiogroup4.ItemIndex]+edit7.Text;
  case radiogroup4.ItemIndex of
   0: sgrid1.Cells[2,j] := 'and Data0022.tax_price = '+edit7.Text;
   1: sgrid1.Cells[2,j] := 'and Data0022.tax_price > '+edit7.Text;
   2: sgrid1.Cells[2,j] := 'and Data0022.tax_price < '+edit7.Text;
  end;
  end;

 9:
   begin
    sgrid1.Cells[1,j]:=ComboBox1.Text;
    if ComboBox1.ItemIndex=0 then
     sgrid1.Cells[2,j]:='and data0456.ttype = 1'
    else
     if ComboBox1.ItemIndex=1 then
      sgrid1.Cells[2,j]:='and data0456.ttype =3'
     else
      if ComboBox1.ItemIndex=2 then
       sgrid1.Cells[2,j]:='and data0456.ttype =4'
      else
       sgrid1.Cells[2,j]:='and data0456.ttype = 5';
   end;
 10:
   case radiogroup4.ItemIndex of
    0:sgrid1.Cells[2,j]:='and data0019.inv_group_name = '''+trim(edit7.Text)+'''';
    1:sgrid1.Cells[2,j]:='and data0019.inv_group_name LIKE ''%'+trim(edit7.Text)+'%''';
   end;
 end;

end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if sgrid1.Row=sgrid1.RowCount-1 then
 n1.Enabled:=false
else
 n1.Enabled:=true;
end;

procedure TForm1.N1Click(Sender: TObject);
var
 i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i]:=sgrid1.Rows[i+1];
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TForm1.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
   sgrid1.MouseToCell(x,y,column,row);
   if (row>0)  then
    begin
     sgrid1.Row:=row;
    end;
 end;
end;
procedure TForm1.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
if ListBox7.ItemIndex=8 then

if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
 abort
else
 if (key = chr(46)) and  (pos('.',edit7.Text)>0) then      //判断是否重复输入小数点'.'
  abort;

end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
if trim(edit2.Text)<>'' then
 button2.Enabled:=true
else
 button2.Enabled:=false;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if ListBox2.ItemIndex=14 then

if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
 abort
else
 if (key = chr(46)) and  (pos('.',edit2.Text)>0) then      //判断是否重复输入小数点'.'
  abort;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  GroupBox1.Top   :=GroupBox4.Top;
  GroupBox1.Left  :=GroupBox4.Left;
  GroupBox2.Top   :=GroupBox4.Top;
  GroupBox2.Left  :=GroupBox4.Left;
  GroupBox3.Top   :=GroupBox4.Top;
  GroupBox3.Left  :=GroupBox4.Left;
  GroupBox5.Top   :=GroupBox4.Top;
  GroupBox5.Left  :=GroupBox4.Left;
  GroupBox6.Top   :=GroupBox4.Top;
  GroupBox6.Left  :=GroupBox4.Left;
  GroupBox7.Top   :=GroupBox4.Top;
  GroupBox7.Left  :=GroupBox4.Left;

  Self.Width:=630;
  Self.Height:=370;
end;


procedure TForm1.FormActivate(Sender: TObject);
begin
 ListBox1.Selected[0]:=true;

end;

end.

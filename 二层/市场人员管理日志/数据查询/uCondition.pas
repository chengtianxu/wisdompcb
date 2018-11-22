unit uCondition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Spin, Buttons, ComCtrls, Menus, Grids;

type
  TfrmCondition = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    YJH: TSpinEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    SpinEdit2: TSpinEdit;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    SpinEdit1: TSpinEdit;
    Label2: TLabel;
    MJH: TSpinEdit;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Edit1: TEdit;
    ListBox1: TListBox;
    StaticText3: TStaticText;
    Button1: TButton;
    BitBtn4: TBitBtn;
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    Edit2: TEdit;
    ListBox2: TListBox;
    StaticText4: TStaticText;
    Button2: TButton;
    BitBtn5: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    RadioGroup1: TRadioGroup;
    GroupBox6: TGroupBox;
    Label10: TLabel;
    Edit3: TEdit;
    ListBox3: TListBox;
    StaticText1: TStaticText;
    Button3: TButton;
    BitBtn6: TBitBtn;
    BitBtn2: TBitBtn;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBox3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
  private
    _704SQL,_708SQL,_712SQL:string;

    function CreatXSMBSearch():string;//销售目标条件
    function CreatGZRZSearch():string;//工作日志条件
    function CreatGZZJSearch():string;//工作总结条件
  public

  end;

var
  frmCondition: TfrmCondition;

implementation
 uses DateUtils, uSearchDept, uXSMB, uDM, uGZRZ, uXSZJ, uEMPInfo,common;
{$R *.dfm}

function TfrmCondition.CreatXSMBSearch():string;
var
 vstr:string;                             //销售目标条件
 i:integer;
begin
  vstr:='';
   for i:=1 to sgrid1.RowCount-2 do
    vstr:=vstr+sgrid1.Cells[2,i]+#13;
 result:=vstr;
end;

function TfrmCondition.CreatGZRZSearch():string;
var                              //工作日志条件
 vstr:string;
 i:integer;
begin
 vstr:='';
   for i:=1 to sgrid1.RowCount-2 do
    vstr:=vstr+sgrid1.Cells[2,i]+#13;
 result:=vstr;
end;

function TfrmCondition.CreatGZZJSearch():string;
var
 vstr:string;
 i:integer;                      //工作总结条件
begin
   vstr:='';
   for i:=1 to sgrid1.RowCount-2 do
    vstr:=vstr+sgrid1.Cells[2,i]+#13;
 result:=vstr;
end;
procedure TfrmCondition.FormCreate(Sender: TObject);

begin
 if not app_init(dm.Conn) then
  begin
   showmsg('程序起动失败,请联系管理员!',1);
   application.Terminate;
  end;
  self.Caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

end;

procedure TfrmCondition.BitBtn1Click(Sender: TObject);//查找
begin

  if RadioGroup1.ItemIndex=0 then            //销售计划
   begin
    frmXSMB:=TfrmXSMB.Create(application);
    dm.AQery704.Close ;
    dm.AQery704.SQL.Text:=_704SQL+CreatXSMBSearch();
    dm.AQery704.Parameters.ParamValues['b_year']:=yjh.Value;
    dm.AQery704.Parameters.ParamValues['e_year']:=spinedit1.Value;
    dm.AQery704.Parameters.ParamValues['b_month']:=mjh.Value;
    dm.AQery704.Parameters.ParamValues['e_month']:=spinedit2.Value;
    dm.AQery704.Open;
    frmXSMB.ShowModal();
    frmXSMB.free;
   end;

  if RadioGroup1.ItemIndex=1 then            //销售日志
   begin
     frmGZRZ:=TfrmGZRZ.Create(application);
     dm.AQery708.Close ;
     dm.AQery708.SQL.Text:=_708SQL+CreatGZRZSearch();
     dm.AQery708.Parameters.ParamValues['b_year']:=yjh.Value;
     dm.AQery708.Parameters.ParamValues['e_year']:=spinedit1.Value;
     dm.AQery708.Parameters.ParamValues['b_month']:=mjh.Value;
     dm.AQery708.Parameters.ParamValues['e_month']:=spinedit2.Value;
     dm.AQery708.Open;

     frmGZRZ.ShowModal();
     frmGZRZ.free;
   end;
  if RadioGroup1.ItemIndex=2 then            //销售总结
   begin
     frmXSZJ:=TfrmXSZJ.Create(application);
     dm.AQery712.Close ;
     dm.AQery712.SQL.Text:=_712SQL+CreatGZZJSearch();
     dm.AQery712.Parameters.ParamValues['b_year']:=yjh.Value;
     dm.AQery712.Parameters.ParamValues['e_year']:=spinedit1.Value;
     dm.AQery712.Parameters.ParamValues['b_month']:=mjh.Value;
     dm.AQery712.Parameters.ParamValues['e_month']:=spinedit2.Value;
     dm.AQery712.Open;

     frmXSZJ.ShowModal();
     frmXSZJ.free;
   end;
end;

procedure TfrmCondition.FormShow(Sender: TObject);

begin

 if dm.Conn.Connected then
  begin
 YJH.Value:=Yearof(now);
 MJH.Value:=monthof(now);
 SpinEdit1.Value:=Yearof(now);
 SpinEdit2.Value:=monthof(now);
 _704SQL:=dm.AQery704.SQL.Text;
 _708SQL:=dm.AQery708.SQL.Text;
 _712SQL:=dm.AQery712.SQL.Text;
 RadioGroup1Click(nil);
  end;

end;
//选择查询的分类
procedure TfrmCondition.RadioGroup1Click(Sender: TObject);
begin
 GroupBox4.Visible:=false;
 GroupBox5.Visible:=false;
 GroupBox6.Visible:=false;
 if RadioGroup1.ItemIndex =0 then
   GroupBox4.Visible:=true;

 if RadioGroup1.ItemIndex =1 then
   GroupBox5.Visible:=true;

 if RadioGroup1.ItemIndex =2 then
   GroupBox6.Visible:=true;

BitBtn2Click(sender);
   
end;
//计划人
procedure TfrmCondition.ListBox1Click(Sender: TObject);
begin
 label7.Caption:=listbox1.Items[listbox1.itemindex];
 Edit1.Text:='';
 edit1.Visible:=true;
 button1.Enabled:=false;
 bitbtn4.Visible:=false;
 combobox1.Visible:=false;
 case listbox1.ItemIndex of
  1,2:
    begin
     bitbtn4.Visible:=true;
    end;
  3:
   begin
    edit1.Visible:=false;
    combobox1.Visible:=true;
    button1.Enabled:=true;
   end;
 end;//end case
end;
//计划
procedure TfrmCondition.BitBtn4Click(Sender: TObject);
begin
  case listbox1.ItemIndex of
   1: //创建人
    begin
     Application.CreateForm(TfrmEMPINFO, frmEMPINFO);
     frmEMPINFO.AQery5.Open ;
     if trim(Edit1.Text)<>'' then
      frmEMPINFO.Edit1.Text:=trim(Edit1.Text);
     if frmEMPINFO.ShowModal=mrOk then
      begin
       edit1.Text:=frmEMPINFO.AQery5.FieldValues['EMPL_CODE'];//职位
       button1.Enabled:=true;
      end;

     frmEMPINFO.Free();
    end;

   2://创建人部门
    begin
     frmSearchDept:=TfrmSearchDept.Create(application);

     if trim(Edit1.Text)<>'' then
       frmSearchDept.Edit1.Text:=trim(Edit1.Text);
     if frmSearchDept.ShowModal=mrok then
       begin
        Edit1.Text:=trim(frmSearchDept.AQuery34dept_code.Value);
        button1.Enabled:=true;
       end;
     frmSearchDept.free;
    end;

  end;//end case
end;

//计划增加条件
procedure TfrmCondition.Button1Click(Sender: TObject);
var
 i:integer;
begin
  for i:=1 to sgrid1.RowCount-2 do
   if sgrid1.Cells[0,i]=listbox1.Items[listbox1.itemindex]  then
    begin
     messagedlg('同一个条件项目不能增加两次!',mtinformation,[mbok],0);
     exit;
    end;

  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox1.Items[listbox1.itemindex];
  sgrid1.Cells[1,sgrid1.RowCount-1]:=Edit1.Text;

  case listbox1.ItemIndex of
   0: //计划编号
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0704.JHID LIKE ''%'+Edit1.Text+'%''';
   1: //计划人
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0005.EMPL_CODE LIKE ''%'+Edit1.Text+'%''';
   2: //计划人部门
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0034.DEPT_CODE like ''%'+Edit1.Text+'%''';
   3:
   begin
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0704.ZYStatus = '+inttostr(combobox1.ItemIndex+1);
    sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox1.Text;
   end;
  end;
  sgrid1.RowCount:=sgrid1.RowCount+1;

end;

procedure TfrmCondition.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

end;
//删除条件
procedure TfrmCondition.N1Click(Sender: TObject);
var
 i:byte;
begin
 if sgrid1.RowCount=2 then exit;
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i]:=sgrid1.Rows[i+1];
 sgrid1.RowCount:=sgrid1.RowCount-1;

end;
//重条件
procedure TfrmCondition.BitBtn2Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-1 do
  sgrid1.Rows[i].Clear;
 sgrid1.RowCount:=2;
end;
//日志
procedure TfrmCondition.ListBox2Click(Sender: TObject);
begin
 Label9.Caption:=listbox2.Items[listbox2.itemindex];
 Edit2.Text:='';
 edit2.Visible:=true;
 button2.Enabled:=false;
 bitbtn5.Visible:=false;
 combobox2.Visible:=false;
 case listbox2.ItemIndex of
  1,2:begin
     bitbtn5.Visible:=true;
    end;
  3:
  begin
   edit2.Visible:=false;
   combobox2.Visible:=true;
   button2.Enabled:=true;
  end;
 end;//end case
end;
//日志
procedure TfrmCondition.BitBtn5Click(Sender: TObject);
begin
  case listbox2.ItemIndex of
   1: //创建人
    begin
     Application.CreateForm(TfrmEMPINFO, frmEMPINFO);
     frmEMPINFO.AQery5.Open ;
     if trim(Edit2.Text)<>'' then
      frmEMPINFO.Edit1.Text:=trim(Edit2.Text);
     if frmEMPINFO.ShowModal=mrOk then
      begin
       edit2.Text:=frmEMPINFO.AQery5.FieldValues['EMPL_CODE'];//职位
       button2.Enabled:=true;
      end;

     frmEMPINFO.Free();
    end;

   2: //创建人部门
    begin
     frmSearchDept:=TfrmSearchDept.Create(application);
     if trim(Edit2.Text)<>'' then
       frmSearchDept.Edit1.Text := trim(Edit2.Text);
     if frmSearchDept.ShowModal=mrok then
       begin
        Edit2.Text:=trim(frmSearchDept.AQuery34dept_code.Value);
        button2.Enabled:=true;
       end;
     frmSearchDept.free;
    end;

  end;//end case
end;

procedure TfrmCondition.Button2Click(Sender: TObject);
var
 i:integer;
begin
  for i:=1 to sgrid1.RowCount-2 do
   if sgrid1.Cells[0,i]=listbox2.Items[listbox2.itemindex]  then
    begin
     messagedlg('同一个条件项目不能增加两次!',mtinformation,[mbok],0);
     exit;
    end;

  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox2.Items[listbox2.itemindex];
  sgrid1.Cells[1,sgrid1.RowCount-1]:=Edit2.Text;

  case listbox2.ItemIndex of
   0: //日志编号
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0708.RZID LIKE ''%'+Edit2.Text+'%''';
   1: //计划人
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0005.EMPL_CODE LIKE ''%'+Edit2.Text+'%''';
   2: //计划人部门
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0034.DEPT_CODE = '''+Edit2.Text+'''';
   3:
   begin
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0708.ZYStatus = '+inttostr(combobox2.ItemIndex+1);
    sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox2.Text;
   end;
  end;
  sgrid1.RowCount:=sgrid1.RowCount+1;

end;
//日志
procedure TfrmCondition.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

end;
//总结
procedure TfrmCondition.ListBox3Click(Sender: TObject);
begin
 Label10.Caption:=listbox3.Items[listbox3.itemindex];
 Edit3.Text:='';
 edit3.Visible:=true;
 combobox3.Visible:=false;
 button3.Enabled:=false;
 bitbtn6.Visible:=false;

 case listbox3.ItemIndex of
  1,2:begin
     bitbtn6.Visible:=true;
    end;
  3:
  begin
   edit3.Visible:=false;
   combobox3.Visible:=true;
   button3.Enabled:=true;
  end;
 end;//end case
end;
// 总结
procedure TfrmCondition.BitBtn6Click(Sender: TObject);
begin
  case listbox3.ItemIndex of
   1: //创建人
    begin
     Application.CreateForm(TfrmEMPINFO, frmEMPINFO);
     frmEMPINFO.AQery5.Open ;
     if trim(Edit3.Text)<>'' then
      frmEMPINFO.Edit1.Text:=trim(Edit3.Text);
     if frmEMPINFO.ShowModal=mrOk then
      begin
       edit3.Text:=frmEMPINFO.AQery5.FieldValues['EMPL_CODE'];//职位
       button3.Enabled:=true;
      end;

     frmEMPINFO.Free();
    end;

   2: //创建人部门
    begin
     frmSearchDept:=TfrmSearchDept.Create(application);

     if trim(Edit3.Text)<>'' then
       frmSearchDept.Edit1.Text:=trim(Edit3.Text);
     if frmSearchDept.ShowModal=mrok then
       begin
        Edit3.Text:=trim(frmSearchDept.AQuery34dept_code.Value);
        button3.Enabled:=true;
       end;
     frmSearchDept.free;
    end;

  end;//end case
end;

procedure TfrmCondition.Button3Click(Sender: TObject);
var
 i:integer;
begin
  for i:=1 to sgrid1.RowCount-2 do
   if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex]  then
    begin
     messagedlg('同一个条件项目不能增加两次!',mtinformation,[mbok],0);
     exit;
    end;

  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
  sgrid1.Cells[1,sgrid1.RowCount-1]:=Edit3.Text;

  case listbox3.ItemIndex of
   0: //总结编号
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0712.ZJID LIKE ''%'+Edit3.Text+'%''';
   1: //总结人
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0005.EMPL_CODE LIKE ''%'+Edit3.Text+'%''';
   2: //总结人部门
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0034.DEPT_CODE like '''+Edit3.Text+'%''';
   3:
   begin
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0712.ZYStatus = '+inttostr(combobox3.ItemIndex+1);
    sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox3.Text;
   end;
  end;
  sgrid1.RowCount:=sgrid1.RowCount+1;

end;

procedure TfrmCondition.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.Text)<>'' then
  button1.Enabled:=true
 else
  button1.Enabled:=false;
end;

procedure TfrmCondition.Edit3Change(Sender: TObject);
begin
 if trim(Edit3.Text)<>'' then
  button3.Enabled:=true
 else
  button3.Enabled:=false;
end;

procedure TfrmCondition.Edit2Change(Sender: TObject);
begin
 if trim(Edit2.Text)<>'' then
  button2.Enabled:=true
 else
  button2.Enabled:=false;
end;

end.

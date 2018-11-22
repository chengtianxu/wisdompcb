unit UWzpr125;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, Grids, StdCtrls, Buttons, ExtCtrls,common;

type
  TMain_Form = class(TForm)
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    StringGrid1: TStringGrid;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    BitBtn1: TBitBtn;
    ADOQuery1Rkey: TAutoIncField;
    ADOQuery1S_No: TIntegerField;
    ADOQuery1PCB_Type: TStringField;
    ADOQuery1Disc_Rate: TBCDField;
    ADOQuery1Up_Limit: TBCDField;
    ADOQuery1Low_Limit: TBCDField;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
  private
     { Private declarations }
  public
    { Public declarations }
  end;

var
  Main_Form: TMain_Form;
  v_edit:boolean;
implementation

uses UDetail;

{$R *.dfm}

procedure TMain_Form.FormCreate(Sender: TObject);
begin
if not App_Init(ADOConnection1) then
  begin
    ShowMsg('程序起动失败,请联系管理员!',1);
    application.Terminate;
    exit;
  end;
  
// vprev := '4';
 // user_ptr := '3';
 
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;


procedure TMain_Form.FormActivate(Sender: TObject);
var
i : integer;
begin
if not adoquery1.Active then adoquery1.Active:=true;
//if not adoquery2.Active then adoquery2.Active:=true;

 stringgrid1.Cells[0,0]:='编号';
 stringgrid1.Cells[1,0]:='产品类别';
 stringgrid1.Cells[2,0]:='提成比例%';
 stringgrid1.Cells[3,0]:='折率下限%';
 stringgrid1.Cells[4,0]:='折率上限%';

 if not adoquery1.IsEmpty  then
 begin
 for i:=1 to adoquery1.RecordCount do
    begin
        stringgrid1.RowCount := i + 1;
        stringgrid1.Cells[0,i]:=adoquery1.FieldValues['S_No'];
        stringgrid1.Cells[1,i]:=adoquery1.FieldValues['PCB_Type'];
        stringgrid1.Cells[2,i]:=adoquery1.FieldValues['Disc_Rate'];
        stringgrid1.Cells[3,i]:=adoquery1.FieldValues['Low_Limit'];
        stringgrid1.Cells[4,i]:=adoquery1.FieldValues['Up_Limit'];
        adoquery1.Next;
    end;
    stringgrid1.FixedRows :=1;
  end
  else
  begin
        stringgrid1.RowCount := 2;
        stringgrid1.FixedRows :=1;
        n2.Enabled := false;
        n3.Enabled := false;
  end;
  adoquery1.First;
end;

procedure TMain_Form.BitBtn1Click(Sender: TObject);
var
 v_message:integer;
 bEof: boolean;
begin
if v_edit then
 begin
 v_message:=messagedlg('数据已修改,是否存盘?',mtConfirmation,[mbyes,mbno,mbcancel],0);
  if v_message=7 then
   begin
    bEof := false;
     while adoquery1.UpdateStatus = usInserted do
     begin
      if adoquery1.Eof then bEof := true;
         if (not adoquery1.Eof) and (not bEof) then
              adoquery1.Next
         else
              adoquery1.Prior;
     end;
     adoquery1.cancelBatch();
     Application.Terminate;
    {adoquery1.CancelBatch();
    Application.Terminate;    //取消对所有记录的修改包括新增 }
   end
  else
   if v_message=6 then    //对修改的记录存盘
    begin
      bitbtn2click(sender);
      Application.Terminate;
    end
    else                    //cancel不存盘也不保存
      exit;
 end
else
 Application.Terminate;
end;

procedure TMain_Form.BitBtn2Click(Sender: TObject);
var
 searchoption:tlocateoptions;
 i:byte;
begin
if (vprev = '1') or (vprev = '3') then
 begin
    showmsg('你只有查看权限，不能做其他操作',1);
 end
 else
 begin
    if not adoquery1.IsEmpty  then
    begin
       searchoption:=[lopartialkey];
       adoquery1.Edit;
        for i:=1 to adoquery1.RecordCount do
        begin
             Adoquery1.Locate('S_No',stringgrid1.Cells[0,i],searchoption);
             adoquery1.Edit;
             ADOQuery1.FieldValues['S_No'] := i;
             if not adoquery1.Eof  then
             adoquery1.Next;
        end;
    adoquery1.UpdateBatch();
    bitbtn2.Enabled := false;
    v_edit:=false;
    application.Terminate;
  end
  else
  begin
    adoquery1.UpdateBatch();
    bitbtn2.Enabled := false;
    v_edit:=false;
    application.Terminate;
  end;
 end;
end;

procedure TMain_Form.N1Click(Sender: TObject);
begin
if (vprev = '1') or (vprev = '3') then
 begin
    showmsg('你只有查看权限，不能做其他操作',1);
 end
 else
 begin
    adoquery1.Append;
    bitbtn2.Enabled := true;
    Detail_Form.Edit1.Text:='';
    Detail_Form.Edit2.Text:='';
    Detail_Form.Edit3.Text:='';
    Detail_Form.Edit4.Text:='';
  if Detail_Form.ShowModal=mrok then
    begin
    ADOQuery1.FieldValues['S_No'] :=  adoquery1.RecordCount + 1 ;
    adoquery1.Post;
    v_edit:=true;
    stringgrid1.RowCount := adoquery1.RecordCount + 1;
    stringgrid1.Cells[0,adoquery1.RecordCount]:= adoquery1.FieldValues['S_No'];
    stringgrid1.Cells[1,adoquery1.RecordCount]:=adoquery1.FieldValues['PCB_Type'];
    stringgrid1.Cells[2,adoquery1.RecordCount]:= formatfloat('0.00',adoquery1.FieldValues['Disc_Rate']);
    stringgrid1.Cells[3,adoquery1.RecordCount]:= formatfloat('0.00',adoquery1.FieldValues['Low_Limit']);
    stringgrid1.Cells[4,adoquery1.RecordCount]:= formatfloat('0.00',adoquery1.FieldValues['Up_Limit']);

  end;
 end;
end;

procedure TMain_Form.N2Click(Sender: TObject);
var
 searchoption:tlocateoptions;
begin
if (vprev = '1') or (vprev = '3') then
 begin
    showmsg('你只有查看权限，不能做其他操作',1);
 end
 else
 begin
    searchoption:=[lopartialkey];
    Adoquery1.Locate('S_No',stringgrid1.Cells[0,stringgrid1.Row],searchoption);
    Detail_Form.Edit1.Text:=adoquery1.FieldValues['PCB_Type'];
    Detail_Form.Edit2.Text:=adoquery1.FieldValues['Disc_Rate'];
    Detail_Form.Edit3.Text:=formatfloat('0.00',adoquery1.FieldValues['Low_Limit']);
    Detail_Form.Edit4.Text:=formatfloat('0.00',adoquery1.FieldValues['Up_Limit']);
    Detail_Form.edit1.Font.Color:=clwindowtext;
    adoquery1.Edit;
    if Detail_Form.ShowModal=mrok then
      begin
        {  for i:=1 to 20 do //比较是否有重复类型名称
          begin
              if stringgrid1.Cells[1,i]='' then break;
                if i<>stringgrid1.Row then
                    if comparetext(TRIM(stringgrid1.Cells[1,i]),TRIM(adoquery1.FieldValues['PCB_Type']))=0 then
                    begin
                        messagedlg('类别名重复,请重新输入!',mtwarning,[mbok],0);
                        adoquery1.Cancel;
                        exit;
                    end;
          end; }
            adoquery1.Post;
            v_edit:=true;
            bitbtn2.Enabled := true;
            stringgrid1.Cells[1,stringgrid1.Row]:=adoquery1.FieldValues['PCB_Type'];
            stringgrid1.Cells[2,stringgrid1.Row]:=formatfloat('0.00',adoquery1.FieldValues['Disc_Rate']);
            stringgrid1.Cells[3,stringgrid1.Row]:=formatfloat('0.00',adoquery1.FieldValues['Low_Limit']);
            stringgrid1.Cells[4,stringgrid1.Row]:=formatfloat('0.00',adoquery1.FieldValues['Up_Limit']);
    end;
 end;
end;

procedure TMain_Form.N3Click(Sender: TObject);
var
 searchoption:tlocateoptions;
 i:byte;
begin
if (vprev = '1') or (vprev = '3') then
 begin
    showmsg('你只有查看权限，不能做其他操作',1);
 end
 else
 begin
      searchoption:=[lopartialkey];
      Adoquery1.Locate('S_No',stringgrid1.Cells[0,stringgrid1.Row],searchoption);
      for i:=stringgrid1.Row to adoquery1.RecordCount do
      begin
          if i<>adoquery1.RecordCount then
          begin
             // stringgrid1.Cells[0,i]:=stringgrid1.Cells[0,i+1];
              stringgrid1.Cells[1,i]:=stringgrid1.Cells[1,i+1];
              stringgrid1.Cells[2,i]:=stringgrid1.Cells[2,i+1];
              stringgrid1.Cells[3,i]:=stringgrid1.Cells[3,i+1];
              stringgrid1.Cells[4,i]:=stringgrid1.Cells[4,i+1];
          end else
              begin
                  stringgrid1.Cells[0,i]:='';
                  stringgrid1.Cells[1,i]:='';
                  stringgrid1.Cells[2,i]:='';
                  stringgrid1.Cells[3,i]:='';
                  stringgrid1.Cells[4,i]:='';
              end;
      end;
   adoquery1.Delete;
   v_edit := true;
   bitbtn2.Enabled := true;
   stringgrid1.RowCount := i - 1;
   if not adoquery1.IsEmpty  then
    begin
       searchoption:=[lopartialkey];
       adoquery1.Edit;
        for i:=1 to adoquery1.RecordCount do
        begin
             Adoquery1.Locate('S_No',stringgrid1.Cells[0,i],searchoption);
             adoquery1.Edit;
             ADOQuery1.FieldValues['S_No'] := i;
             if not adoquery1.Eof  then
             adoquery1.Next;
        end;
    end;
   if  stringgrid1.RowCount = 1 then
   begin
          stringgrid1.RowCount := 2;
          stringgrid1.FixedRows :=1;
   end;
  end;
end;

procedure TMain_Form.StringGrid1DblClick(Sender: TObject);
begin
if (vprev = '1') or (vprev = '3') then
 begin
    showmsg('你只有查看权限，不能做其他操作',1);
 end
 else
 begin
  if stringgrid1.Cells[0,stringgrid1.Row] <> '' then
    N2click(sender);
  end;
end;

procedure TMain_Form.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   column,row:longint;
begin
if button=mbright then
 begin
  stringgrid1.MouseToCell(x,y,column,row);
 //showmsg(inttostr(Row),1);
 if not adoquery1.IsEmpty  then
  begin
    if  row = 0 then
      stringgrid1.PopupMenu := nil
    else
      stringgrid1.PopupMenu := PopupMenu1;
      if (row < 0) then
      begin
        n2.Enabled:=false;
        n3.Enabled:=false;
      end else
            if (row <> 0) then
            begin
                  stringgrid1.Row :=row;
                  n2.Enabled:=true;
                  n3.Enabled:=true;
            end;
      end
      else
      begin
            n2.Enabled:=false;
            n3.Enabled:=false;
      end;
 end;
end;

procedure TMain_Form.FormShow(Sender: TObject);
begin
if Adoconnection1.Connected then
 begin

 end;
end;

initialization  //初始发变量
v_edit:=false;

end.

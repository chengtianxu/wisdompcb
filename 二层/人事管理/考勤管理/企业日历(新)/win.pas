unit win;

interface

uses
  Windows, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DateCn, AppEvnts, ComCtrls, Menus, Grids,
  DBGrids;

type
  TForm1 = class(TForm)
    cal: TPanel;
    ltop_pan: TPanel;
    right_pan: TPanel;
    left_pan: TPanel;
    yy: TLabel;
    Label2: TLabel;
    mm: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    sel_pan: TPanel;
    Label3: TLabel;
    ApplicationEvents1: TApplicationEvents;
    yedt: TEdit;
    medt: TEdit;
    yop: TUpDown;
    mop: TUpDown;
    dd: TLabel;
    Panel1: TPanel;
    day_pmenu: TPopupMenu;
    rmsg_edt: TDBGrid;
    dbg_pm: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Panel2: TPanel;
    remark: TMemo;
    slracc: TComboBox;
    procedure Button2Click(Sender: TObject);
    procedure daypanclk(Sender: TObject);
    procedure flipan(Sender: TObject);
    procedure errormsg(id:integer;willexit:Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure buildca(cdate:TDatetime;pan:TPanel);
    procedure builddaypan(pan:TPanel;i,j,y,m,d:Integer;pancl:TColor=clWhite);
    function getpandate:TDate;
    procedure buildmonpan(Sender: TObject);
    procedure buildyearpan(Sender: TObject);
    procedure monlclk(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure mopChangingEx(Sender: TObject; var AllowChange: Boolean;
      NewValue: Smallint; Direction: TUpDownDirection);
    procedure yopChangingEx(Sender: TObject; var AllowChange: Boolean;
      NewValue: Smallint; Direction: TUpDownDirection);
    procedure FormShow(Sender: TObject);
    procedure day_pmenuPopup(Sender: TObject);
    procedure dbg_pmPopup(Sender: TObject);
    procedure rmsg_edtDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rmsg_edtCellClick(Column: TColumn);
    procedure dgb_pmitemclk(sender:TObject);
    procedure slraccChange(Sender: TObject);
    procedure DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure pmitemclk(Sender: TObject);
  private
    procedure opyear(num: Integer);
    { Private declarations }
  public
    function getJRt(y,m,d:Integer):string;
    function getJRb(y,m,d:Integer):string;
    procedure rebuildpm;
    function authcheck(auth:Integer):Boolean;
    { Public declarations }
  end;

var
  Form1: TForm1;

function IsDebuggerPresent : boolean; stdcall; external 'kernel32.dll' name 'IsDebuggerPresent';



implementation

uses dm, DB, data_editor, common;

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
begin
  buildca(Now,cal);
end;

procedure TForm1.buildca(cdate: TDatetime;pan:TPanel);
var
  s:array [0..3] of   Word;
  lmdays,cmdays:Integer;
  i,j,k,y,m:Integer;
  lyear:Boolean;
  specdays:TStrings;
  pcl:TColor;
begin
  specdays:=TStringList.Create;
  pan.Visible:=False;
  DecodeDateFully(cdate,s[0],s[1],s[2],s[3]);
  yy.Caption:=IntToStr(s[0]);
  mm.Caption:=IntToStr(s[1]);
  dd.Caption:=IntToStr(s[2]);
  yedt.Text:=yy.Caption;
  medt.Text:=mm.Caption;
  lyear:=IsLeapYear(s[0]);
  cmdays:=MonthDays[lyear][s[1]];
  if s[1]=1 then
    lmdays:=31
  else
    lmdays:=MonthDays[lyear][s[1]-1];
  i:= s[2] mod 7;
  i:=(s[3]-i) mod 7; // 1号星期几  0 星期天 1 星期1

  udm.getspecday(s[0],s[1],slracc.ItemIndex,specdays);
  //specdays 每项格式为  日=颜色;
  for k:=0 to pan.ComponentCount-1 do
    pan.Components[k].Free;

  y:=s[0];
  m:=s[1];
  j:=(i+7-1) mod 7;


  for k:=j downto 0 do
  begin
    if m=1 then
      builddaypan(pan,j-k,-2,y-1,12,lmdays-k)
    else
      builddaypan(pan,j-k,-2,y,m-1,lmdays-k);
  end;

  if specdays.Count>0 then
  for k:=1 to cmdays do
  begin
    pcl:=clWhite;
    if TryStrToInt(specdays.Names[k-1],i) then
      pcl:= StringToColor(specdays.ValueFromIndex[k-1])
    else
      i:=0;
    builddaypan(pan,k+j,i,y,m,k,pcl);
  end
  else
  for k:=1 to cmdays do
  begin
    builddaypan(pan,k+j,0,y,m,k);
  end;


  if cmdays+j<41 then    //面板尾部还有空位
  for k:=cmdays+j+1 to 41 do
    if m=12 then
      builddaypan(pan,k,-1,y+1,1,k-cmdays-j)
    else
      builddaypan(pan,k,-1,y,m+1,k-cmdays-j);


  pan.Visible:=True;
end;

procedure TForm1.buildyearpan(Sender: TObject);
var
  i,j,y:Integer;
begin
   y:=TControl(Sender).Tag;
   if y=0 then y:= StrToInt(yy.Caption);
   yy.Caption:=IntToStr(y);

   sel_pan.Visible:=true;
   for i:=sel_pan.ControlCount-1 downto 0 do
    sel_pan.Controls[i].Free;



   j:=y-8;
   for i:=0 to 15 do
   with TLabel.Create(nil) do
   begin
     Font.Name:='黑体';
     AutoSize:=False;
     parent:=sel_pan;
     Height:=parent.Height div 4;
     Width:=parent.Width div 4;
     left:=width*(i mod 4);
     Top:=height*(i div 4);
     Font.Size:=parent.Height div 12;
     Alignment:=taCenter;
     tag:=j+i;
     Layout:=tlCenter;
     Transparent:=true;
     Font.Color:=clBlack;
     Caption:=IntToStr(j+i);
     OnClick:=buildmonpan;
   end;
end;

procedure TForm1.buildmonpan(Sender: TObject);
const
  mstr: array [0..11] of string =('一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月');
var
  i,y:Integer;
begin
   y:=TControl(Sender).Tag;
   if y=0 then y:= StrToInt(yy.Caption);
   yy.Caption:=IntToStr(y);
   yedt.Text:=yy.Caption;
   sel_pan.Visible:=true;
   for i:=sel_pan.ControlCount-1 downto 0 do
    sel_pan.Controls[i].Free;
   with TLabel.Create(nil) do
   begin
     Font.Name:='黑体';
     AutoSize:=False;
     parent:=sel_pan;
     Height:=parent.Height div 4;
     Width:=parent.Width div 8;
     left:=0;
     Top:=0;
     Tag:=0;
     Font.Size:=parent.Height div 12;
     Alignment:=taLeftJustify;
     Layout:=tlCenter;
     Transparent:=true;
     Font.Color:=clBlack;
     Caption:='<<';
   end;



   with TLabel.Create(nil) do
   begin
     Font.Name:='黑体';
     AutoSize:=False;
     parent:=sel_pan;
     Height:=parent.Height div 4;
     Width:=parent.Width div 8;
     left:=parent.Width-Width;
     Top:=2;
     Font.Size:=parent.Height div 12;
     Alignment:=taRightJustify;
     Layout:=tlCenter;
     Transparent:=true;
     Font.Color:=clBlack;
     Caption:='>>';
   end;
   with TLabel.Create(nil) do
   begin
     Font.Name:='黑体';
     AutoSize:=False;
     parent:=sel_pan;
     Height:=parent.Height div 4;
     Width:=parent.Width div 2;
     left:=(parent.width-width) div 2;
     Top:=0;
     Font.Size:=parent.Height div 12;
     Alignment:=taCenter;
     Layout:=tlCenter;
     Transparent:=true;
     Font.Color:=clBlack;
     Caption:=IntToStr(y);
     OnClick:=buildyearpan;
   end;

   for i:=0 to 11 do
   with TLabel.Create(nil) do
   begin
     Font.Name:='黑体';
     AutoSize:=False;
     parent:=sel_pan;
     Height:=parent.Height div 4;
     Width:=parent.Width div 4;
     left:=width*(i mod 4);
     Top:=height*((i div 4)+1);
     Font.Size:=parent.Height div 12;
     Alignment:=taCenter;
     Tag:=i;
     Layout:=tlCenter;
     Transparent:=true;
     Font.Color:=clBlack;
     Caption:=mstr[i];
     OnClick:=monlclk;
     OnMouseUp:=nil;
   end;
end;



procedure TForm1.builddaypan(pan: TPanel; i, j, y, m, d: Integer;pancl:TColor=clWhite);
var
  p:TPanel;
begin
   p:=TPanel.Create(nil);
   with p do
   begin
     Width := 80 ;
     Height := 80;
     Parent:=pan;
     Hint:=ColorToString(pancl);
     Left:=width*(i mod 7);
     Top:=Height*(i div 7);
     Visible:=True;
     Font.Name:='黑体';
     Font.Size:=(Width*2) div 6;
     Caption:=IntToStr(d);
     Color:=clWhite;
     PopupMenu:=day_pmenu;
     BorderStyle:=bsNone;
     ParentBackground:=False;
     Color:=pancl;
     case j of
     -2: if m=12 then tag:=0 else tag:=m;
     -1: if m=1  then tag:=13 else tag:=m;
     else
        tag:=j;
     end;
     if j>=0 then
     begin
       OnClick:=daypanclk;
       PopupMenu:=day_pmenu;
       if ((i mod 7)=0) or ((i mod 7)=6) then
         Font.Color:=clRed
       else
         Font.Color:=clBlack;
     end
     else
     begin
       OnClick:=flipan;
       Font.Color:=clGray;
       PopupMenu:=nil;
     end;

   end;
   with TLabel.Create(nil) do
   begin
     Font.Size:=p.Font.Size div 2;
     Font.Name:='黑体';
     AutoSize:=False;
     Align:=alBottom;
     Layout:=tlTop;
     Height:=p.Height div 4;
     Width:=p.Width;
     Parent:=p;
     tag:=p.Tag;
     PopupMenu:=p.PopupMenu;
     Alignment:=taCenter;
     Caption:=getJRb(y,m,d);
     if Caption='' then
       Caption:=CnDayOfDate(y,m,d);
     Transparent:=true;
     Font.Color:=p.Font.Color;
     if j>=0 then
     begin
       OnClick:=daypanclk;
     end
     else
     begin
       OnClick:=flipan;
     end;




   end;
   with TLabel.Create(nil) do
   begin
     Font.Size:=p.Font.Size div 3;
     Font.Name:='黑体';
     AutoSize:=False;
     Align:=alTop;
     Layout:=tlBottom;
     Height:=p.Height div 4;
     Width:=p.Width;
     Parent:=p;
     PopupMenu:=p.PopupMenu;
     Alignment:=taCenter;
     Transparent:=true;
     Font.Color:=p.Font.Color;
     if j>=0 then
     begin
       OnClick:=daypanclk;
     end
     else
     begin
       OnClick:=flipan;
     end;
     tag:=p.Tag;
     Caption:=getJRt(y,m,d);
     if Caption='' then
       Caption:=OtherHoliday(m,d);
   end;
   Application.ProcessMessages;


end;

procedure TForm1.daypanclk(Sender: TObject);
var
  pan:TPanel;
begin
  case TControl(Sender).ClassName[2] of
  'L':  pan:=TPanel(TControl(Sender).Parent);
  'P':  pan:= TPanel(Sender);
  end;
  dd.Caption:=pan.Caption;
  dd.Tag:=pan.Tag;
  if dd.FocusControl<>nil then
    TPanel(dd.FocusControl).Color:=StringToColor(TPanel(dd.FocusControl).Hint);
  pan.Color:=clHighlight;
  dd.FocusControl:=pan;
end;



procedure TForm1.flipan(Sender: TObject);
var
  i:Integer;
begin
  i:=TControl(Sender).Tag;

  case i of
  13: begin
       mm.Caption:=IntToStr(1);
       yy.Caption:=IntToStr(StrToInt(yy.Caption)+1);
     end;
  0:begin
       mm.Caption:=IntToStr(12);
       yy.Caption:=IntToStr(StrToInt(yy.Caption)-1);
     end;
  else
     mm.Caption:=IntToStr(i);
  end;
  buildca(getpandate,cal);

end;

function TForm1.getpandate: TDate;
var
  y,m,d:Word;
  iy,im,id:Integer;
begin
  DecodeDate(Now,y,m,d);
  Result:=EncodeDate(y,m,d);
  if not TryStrToInt(yy.Caption,iy) then
     errormsg(0,True);
  if not TryStrToInt(mm.Caption,im) then
     errormsg(0,True);
  if not TryStrToInt(dd.Caption,id) then
     errormsg(0,True);
  Result:=EncodeDate(iy,im,id);

end;

procedure TForm1.errormsg(id: integer;willexit:Boolean);
var
  msg:string;
begin

  case id of
  0:msg:='无法将标签时间转换成日期,请检查!';
  1:msg:='添加节假日失败,请检查!';
  2:msg:='删除节假日失败,请检查!';
  3:msg:='更新节假日失败,请检查!';
  4:msg:='新增节日失败！';
  5:msg:='修改节日失败！';
  6:msg:='该节日类型已使用，无法删除。如需删除请先取消该节日类型的所有设置！';
  end;
  ShowMessage(msg);
  if willexit then Exit;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i,j:integer;
  str:string;
  ccbitems:TStrings;
begin
   Application.OnException:=ApplicationEvents1.OnException;
   for i:=0 to 6 do
   with TLabel.Create(nil) do
   begin
     str:='';
     case i of
     0: str:='日';
     1: str:='一';
     2: str:='二';
     3: str:='三';
     4: str:='四';
     5: str:='五';
     6: str:='六';
     end;

     case i of
     0,6:Font.Color:=clRed;
     else
         Font.Color:=clBlack;
     end;

     j:=ltop_pan.Height div 3;
     Font.Size:=j div 2;
     Font.Name:='黑体';
     AutoSize:=False;
     Height:=j;
     top:=ltop_pan.Height-j-1;
     j:=ltop_pan.Width div 7;
     left:=j*i;
     Layout:=tlTop;
     Width:=j;
     Parent:=ltop_pan;
     Alignment:=taCenter;
     Caption:='星期'+str;
     Transparent:=true;
   end;

   if IsDebuggerPresent then
   begin
     udm.adocon.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdompcb1077;'+
                                  'Persist Security Info=True;User ID=sa;'+
                                  'Initial Catalog=sj_v20_live;Data Source=172.16.68.8';
     vprev:='4';
   end
   else
   if not App_init_2(udm.adocon) then
   begin
     showmsg('程序起动失败请联系管理员!',1);
     application.Terminate;
   end;

   if udm.adocon.ConnectionString<>'' then
   begin
     udm.adotbl.Open;
     ccbitems:=TStringList.Create;
     udm.getslrnames(ccbitems);
   end
   else
   begin
     ShowMessage('程序起动失败请联系管理员2');
     application.Terminate;
   end;

   if ccbitems<>nil then
     for i:=0 to ccbitems.Count-1 do
       slracc.AddItem(ccbitems.Strings[i],ccbitems.Objects[i]);
   if slracc.Items.Count>0 then
   slracc.ItemIndex:=0;

   rebuildpm;






end;

procedure TForm1.Button1Click(Sender: TObject);
const
  mstr: array [0..11] of string =('一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月');
var
  i:Integer;
begin
   for i:=0 to 11 do
   with TLabel.Create(nil) do
   begin

     Font.Name:='黑体';
     AutoSize:=False;
     parent:=sel_pan;
     Height:=parent.Height div 4;
     Width:=parent.Width div 4;
     left:=width*(i mod 4);
     Top:=height*((i div 4)+1);
     Font.Size:=parent.Height div 12;
     Alignment:=taCenter;
     Canvas.Pen.Width:=3;

     Layout:=tlCenter;
     Transparent:=true;
     name:=parent.Name+'m'+IntToStr(i);
     Font.Color:=clBlack;
     Caption:=mstr[i];
     Canvas.Rectangle(ClientRect);
   end;

end;



procedure TForm1.monlclk(Sender: TObject);
var
  m:Integer;
begin
  m:= TControl(Sender).Tag;
  mm.Caption:=IntToStr(m+1);
  medt.Text:=mm.Caption;
  buildca(getpandate,cal);
  sel_pan.Visible:=False;
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
  buildca(Now,cal);
end;

procedure TForm1.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
  Sleep(1);
end;

procedure TForm1.opyear(num: Integer);
var
  i:Integer;
begin
  if TryStrToInt(yy.Caption,i) then
  begin
    i:=i+num;
    yy.Caption:=IntToStr(i);
  end;
end;

procedure TForm1.mopChangingEx(Sender: TObject; var AllowChange: Boolean;
  NewValue: Smallint; Direction: TUpDownDirection);
begin
  AllowChange:=False;
  case NewValue of
  0:  opyear(-1);
  13: opyear(1);
  else
    AllowChange:=True;
  end;
  case NewValue of
  0:  NewValue:=12;
  13: NewValue:=1;
  end;
  mm.Caption:=IntToStr(NewValue);
  medt.Text:=mm.Caption;
  buildca(getpandate,cal);
end;

procedure TForm1.yopChangingEx(Sender: TObject; var AllowChange: Boolean;
  NewValue: Smallint; Direction: TUpDownDirection);
begin
  yy.Caption:=IntToStr(NewValue);
  buildca(getpandate,cal);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  buildca(Now,cal);
end;

procedure TForm1.day_pmenuPopup(Sender: TObject);
var
  pan:TPanel;
begin
  //********** 日期 RKEY算法*********
  // 月最大天数 31  比32(2&6)少1 二进制为 11111
  //  就是说天数只占5位
  // 就是说支持的rkey 最大为 2^(32-5)-1=134,217,727
  //

  case TControl(day_pmenu.PopupComponent).ClassName[2] of
  'L':  pan:=TPanel(TControl(day_pmenu.PopupComponent).Parent);
  'P':  pan:= TPanel(day_pmenu.PopupComponent);
  end;
  day_pmenu.Tag:=StrToInt(pan.Caption)+pan.Tag*32;

end;

procedure TForm1.dbg_pmPopup(Sender: TObject);
var
  b:Boolean;
begin
  b:=udm.adotbl.FieldByName('userdefine').AsBoolean;
  N2.Visible:=b;
  N3.Visible:=b;

end;

procedure TForm1.rmsg_edtDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    (Sender as TDBGrid).Canvas.Brush.Color:=StringToColor(udm.adotbl.FieldByName('color').AsString);
    //(Sender as TDBGrid).Canvas.Font.Color:=StringToColor(udm.adotbl.FieldByName('color').AsString);
    (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure TForm1.rmsg_edtCellClick(Column: TColumn);
begin
  remark.Lines.Clear;
  remark.Lines.Add(udm.adotbl.FieldByName('remark').AsString)
end;

procedure TForm1.dgb_pmitemclk(sender: TObject);
var
  edtor:Tdataedt;
begin
  if not authcheck(2) then
  begin
    ShowMessage('你无权进行此操作!');
    Exit;
  end;
  edtor:=Tdataedt.Create(nil);
  edtor.Tag:=(Sender as TMenuItem).Tag;
  case edtor.ShowModal of
  mrAbort: errormsg((Sender as TMenuItem).Tag+3,True);
  mrOk:   begin
            udm.adotbl.Requery;
            rebuildpm;
          end;
  else
    Exit;
  end;
end;

function TForm1.getJRt(y, m, d: Integer): string;
begin
  Result:=Holiday(EncodeDate(y,m,d),d);
  if Result='' then Result:=CnDayOfDateJr(EncodeDate(y,m,d));
  if Result='' then Result:=OtherHoliday(m,d);
end;

function TForm1.getJRb(y, m, d: Integer): string;
begin
  Result:=GetLunarHolDay(EncodeDate(y,m,d));
  if Result='' then Result:=CnDayOfDate(EncodeDate(y,m,d));
end;

procedure TForm1.slraccChange(Sender: TObject);
begin
  buildca(EncodeDate(StrToInt(yy.Caption),StrToInt(mm.Caption),StrToInt(dd.Caption)),cal);
end;

procedure TForm1.rebuildpm;
var
  spm:TMenuItem;
begin
  day_pmenu.Items.Clear;
  with udm.adotbl do
  if Active then
  begin
    First;
    while not Eof do
    begin
      spm:=TMenuItem.Create(nil);
      spm.Caption:=FieldValues['resttype_name'];
      spm.Hint:=FieldValues['color'];
      spm.Tag:=FieldValues['rkey'];
      spm.OnDrawItem:=DrawItem;
      spm.OnClick:=pmitemclk;
      day_pmenu.Items.Add(spm);
      Next;
    end;
    spm:=TMenuItem.Create(nil);
    spm.Caption:='取消设定';
    spm.Hint:='clblack';
    spm.Tag:=0;
    spm.OnDrawItem:=DrawItem;
    spm.OnClick:=pmitemclk;
    day_pmenu.Items.Add(spm);
  end;
end;

procedure TForm1.DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
var
  spm:TMenuItem;
begin
  spm:=TMenuItem(Sender);

  if Selected then
    ACanvas.Brush.Color:=StringToColor(spm.Hint);
  //ACanvas.Font.Color:=clBlack;
  //ACanvas.Font.Name:='宋体';
  //ACanvas.Font.Size:=9;
  ACanvas.TextRect(ARect,ARect.Left+5,ARect.Top+2,spm.Caption);
end;

procedure TForm1.pmitemclk(Sender: TObject);
var
  y,m,d,r,t,idx,accid,errid:Integer;
  s:TMenuItem;
begin
  if not authcheck(2) then
  begin
    ShowMessage('你无权进行此操作!');
    Exit;
  end;
  y:=StrToInt(yy.Caption);
  m:=StrToInt(mm.Caption);
  s:=TMenuItem(sender);
  r:=day_pmenu.Tag shr 5;
  d:=day_pmenu.Tag and 31;
  t:=s.Tag;
  idx:=slracc.ItemIndex;
  accid:=Integer(slracc.Items.Objects[idx]);
  if not udm.setdayqry(r,idx,y,m,d,t,accid) then
  begin
    errid:= (Integer(r>0) shl 1)+Integer(t>0);
    // 00 无操作 不会存在这个错误
    // 01 insert  插入记录
    // 10 delete  删除记录
    // 11 update  更新记录
    errormsg(errid,True);
  end
  else
    buildca(getpandate,cal);

end;

function TForm1.authcheck(auth:Integer):Boolean;
var
  oauth:Integer;
begin
  Result:=False;
  if TryStrToInt(vprev,oauth) then
  if ((oauth = auth) or ((oauth shr 1)=auth)) then
  begin
    Result:=True;
  end;
end;

end.

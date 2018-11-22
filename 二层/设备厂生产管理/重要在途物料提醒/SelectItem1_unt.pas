unit SelectItem1_unt;
{EditButton控件调用}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  StdCtrls, ExtCtrls, DB,StrUtils,
  Buttons, Grids, DBGrids, ADODB, DBClient, Menus, DBGridEh;

type
  TSelectItem1_frm = class(TForm)
    pnl2: TPanel;
    pnl1: TPanel;
    Edit1: TEdit;
    ds1: TDataSource;
    bt1: TSpeedButton;
    Button1: TButton;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    CheckBox2: TCheckBox;
    dgh1: TDBGridEh;
    SpeedButton1: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Dgh1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bt1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure dgh1KeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox2Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dgh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dgh1TitleClick(Column: TColumnEh);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure dgh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure dgh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    AColsInfo :string;
    procedure cdsFilterRecord(DataSet: TDataSet;
         var Accept: Boolean);
   // procedure Add_Grid_Fields_New(StrFields: WideString);
    { Private declarations }
  public
    FilterFieldName:string;
    { Public declarations }
  end;

var
  SelectItem1_frm: TSelectItem1_frm;

Function Show_Item1_frm(ADODataSet: TDataSet;AFilterField:string;FilterFieldValue:string;
    ColsInfo :WideString;ASenderControl:TControl;FormCaption:string=''):Boolean; //StdCall;

implementation

{$R *.dfm}

Function Show_Item1_frm(ADODataSet: TDataSet;AFilterField:string;FilterFieldValue:string;
    ColsInfo :WideString;ASenderControl:TControl;FormCaption:string=''):Boolean;
  procedure Add_Grid_Fields_New();
  var                                                              //********在Delphi7这个版本下，要用WideString字符来处理 **********//
    i,j,k,TotalWidth,ColWidth:integer;
    I_Left,I_Top,I_Width,I_Hieght:Integer;
    Left_str,right_str,FieldName,FieldCaption,TmpStr,StrFields:WideString;
    NewColumn:TColumnEh;
    v_Point:TPoint;
  begin
    SelectItem1_frm.dgh1.Columns.Clear;
    TotalWidth:=0;
    StrFields:= ColsInfo;
    while StrFields <> '' do
    begin
      //从字段信息串中获取每个字段名称以及显示caption
      i:= Pos(',',StrFields);
      if i > 0 then //找到了字段分割符号
      begin
        left_str:= leftStr(StrFields,i-1);     //获取第一个字段部分
        right_str:=rightStr(StrFields,Length(StrFields)-i);//获取除了第一个字段剩余部分
      end
      else
      begin
        left_str := StrFields; //如果没有找到','
        right_str:='';
      end;

      j:=Pos('/',left_str);  //第一个'/'
      if j>0 then //如果有'/'分割符号，表示有效
      begin
        ColWidth := 0;
        FieldName:= leftstr(left_str,j-1);
        TmpStr:=RightStr(left_str,Length(left_str)-j);
        k:= Pos('/',Tmpstr);     // 第二个'/'
        if K > 0 then  //存在字段宽度数据
        begin
          FieldCaption:=LeftStr(Tmpstr,k-1);
          ColWidth := StrToInt(RightStr(Tmpstr,length(tmpstr)-k));
          TotalWidth := TotalWidth + ColWidth;
        end
        else
          FieldCaption:=Tmpstr;
        if  ColWidth>0 then
        begin
          NewColumn:= SelectItem1_frm.dgh1.Columns.Add;
          NewColumn.FieldName := FieldName;
          NewColumn.Title.Caption := FieldCaption;
          NewColumn.Title.Alignment:=taCenter;
          NewColumn.Width := ColWidth;
        end;
      end;
      StrFields:= right_str;
    end;
    I_Width:=TotalWidth+44;
    if I_Width<360 then
      I_Width:=360     //不能小于330
    else
    if I_Width>700 then
      I_Width:=700;     //不能超过700
    I_Hieght:=Round(I_Width*0.628 )+30 ;
    v_Point := ASenderControl.Parent.ClientToScreen(Point(ASenderControl.Left,ASenderControl.Top));
    if v_Point.y+ASenderControl.Height+I_Hieght>Screen.Height then   //控件按钮所在的高度+控件的高度+弹出窗口的高度 > 屏幕的高度
      I_Top:=v_Point.y-I_Hieght
    else
      I_Top:=v_Point.y+ASenderControl.Height;
      
    I_Left:=Screen.Width- v_Point.X-I_Width;
    if I_Left<0 then
      I_Left:=Screen.Width -I_Width
    else
      I_Left:= v_Point.X;

    with SelectItem1_frm do
    begin
      if I_Width<600 then
      begin
        Top:=I_Top;
        Left:=I_Left;
        Width:=I_Width;
        Height:=I_Hieght;
      end
      else
      begin
        Width:=I_Width;
        Height:=I_Hieght;      
        Position:=poOwnerFormCenter;
      end;
    end;
  end;
begin
  Result:=False;
  try
    SelectItem1_frm:=TSelectItem1_frm.Create(Application);
    with SelectItem1_frm do
    begin
      Font.Size:=Application.MainForm.Font.Size;
      Font.Charset:=Application.MainForm.Font.Charset;
      Font.Name:= Application.MainForm.Font.Name;
      Add_Grid_Fields_New;
//      A_List_Field :=L_List_Field;
//      A_List_Display:=L_ColWidth;
//      A_Col_Width:=L_Col_Width;
      if (VarIsNull(FormCaption))or( FormCaption='') then
        Caption:='选择'
      else
        Caption:=FormCaption;

      ds1.DataSet:=ADODataSet;

      if ds1.DataSet.Active =False then
        ds1.DataSet.Open;   {  }
        
      if ds1.DataSet.Filtered then
      ds1.DataSet.Filtered :=False;

      FilterFieldName:= AFilterField;
      ADODataSet.OnFilterRecord:= cdsFilterRecord;
      Edit1.Text:= FilterFieldValue;
//      SelectItem_frm.Left:=L;
//      SelectItem_frm.Top:=T;
//      SelectItem_frm.Width:=w;
//      SelectItem_frm.Height:=h;
      if SelectItem1_frm.ShowModal=mrOk then
      Result:=True;
    end;
  finally
    SelectItem1_frm.Free;
  end;
end;

procedure TSelectItem1_frm.cdsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if Trim(Edit1.Text) <>'' then
  if CheckBox2.Checked then
    Accept:= UpperCase(Trim(DataSet.FieldByName(FilterFieldName).AsString))=UpperCase(Trim(Edit1.Text) )
  else     //字符串比较不区分大小写
    Accept:=AnsiContainsText(UpperCase(DataSet.FieldByName(FilterFieldName).AsString),UpperCase(Edit1.Text )) ;
end;

procedure TSelectItem1_frm.FormShow(Sender: TObject);
var
  i:Integer;
begin

  Dgh1.SetFocus;
  Edit1.SetFocus;
  if dgh1.DataSource.DataSet is TClientDataSet then
  begin
    with  dgh1.DataSource.DataSet as TClientDataSet do
    if ReadOnly=False then
    begin

      dgh1.PopupMenu:= PopupMenu1;
    end
    else
      dgh1.PopupMenu:= nil;
  end
  else
  if dgh1.DataSource.DataSet is TADODataSet then
  begin
    with  dgh1.DataSource.DataSet as TADODataSet do
    if LockType=ltReadOnly then
    begin
      dgh1.PopupMenu:= PopupMenu1;
    end
    else
      dgh1.PopupMenu:= nil;
  end;

  for I := 0 to Dgh1.FieldCount-1  do
  begin
    if UpperCase(Dgh1.Fields[i].FieldName)=UpperCase(FilterFieldName) then
    begin
      Dgh1.SelectedIndex:=i;
      Dgh1TitleClick(Dgh1.Columns[i]);
      Exit;
    end;
  end;
end;



procedure TSelectItem1_frm.N1Click(Sender: TObject);
begin
  dgh1.DataSource.DataSet.Delete;
end;

procedure TSelectItem1_frm.Edit1Change(Sender: TObject);
begin
  with (Dgh1.DataSource.DataSet as TDataSet) do
  if trim(Edit1.Text) <> '' then
  begin
    Filtered := False;
    Filtered := true;
  end
  else
    Filtered := False;
end;

procedure TSelectItem1_frm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  Dgh1DblClick(Sender);
end;

procedure TSelectItem1_frm.FormClose(Sender: TObject;var Action: TCloseAction);
var
  BM:Pointer ;
begin
  if dgh1.DataSource.DataSet is TClientDataSet then
  begin
    with dgh1.DataSource.DataSet as TClientDataSet  do
    begin
      if State in [dsInsert,dsEdit] then
      Post;
      if ChangeCount>0   then
      if ApplyUpdates(0)=0 then
      begin
        try
          bm:=GetBookmark;//书签。
          Refresh;
          GotoBookmark(BM);  // 重新定位到书签
        finally
          FreeBookmark(bm ) ;
        end;
      end;
    end;
  end
  else
  if dgh1.DataSource.DataSet is TCustomADODataSet then
  begin
    with dgh1.DataSource.DataSet as TCustomADODataSet  do
    begin
      if State in [dsInsert,dsEdit] then
      Post;
    end;
  end;
end;

procedure TSelectItem1_frm.Dgh1DblClick(Sender: TObject);
begin
  Button1.Click;
end;

procedure TSelectItem1_frm.FormCreate(Sender: TObject);
begin;

end;

procedure TSelectItem1_frm.bt1Click(Sender: TObject);
begin
  self.Edit1.Text:='';
  if Dgh1.DataSource.DataSet.Filtered then
  Dgh1.DataSource.DataSet.Filtered :=False;
end;

procedure TSelectItem1_frm.dgh1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  Button1.Click;
end;

procedure TSelectItem1_frm.CheckBox2Click(Sender: TObject);
begin
  Edit1Change(nil);
end;

procedure TSelectItem1_frm.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=40  then
  dgh1.SetFocus   ;
end;

procedure TSelectItem1_frm.dgh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in[VK_INSERT,VK_delete] then   //  , VK_down
  begin
    Key:=0;
  end;
  with   (Sender as TDBGridEh ).DataSource.DataSet  do
  if (Key in[VK_down])and(RecNo=RecordCount ) then    //如果击向下键，且当前记录号等于总记录数
  begin
    Key:=0;
  end;

  if (ssAlt in Shift)  and  (Key=86) then       //Alt+V
  with   (Sender as TDBGridEh).DataSource do
  begin
    if   DataSet is TADOQuery then
      showmessage((DataSet as  TADOQuery).SQL.Text+#13+'当前记录数：'+inttoStr((DataSet as  TADOQuery).recordCount))
    else
    if  DataSet is TADODataSet then
       showmessage((DataSet as  TADODataSet).CommandText+#13+'当前记录数：'+inttoStr((DataSet as  TADODataSet).recordCount))
    else
    if  DataSet is TClientDataSet then
       showmessage((DataSet as  TClientDataSet).CommandText+#13+'当前记录数：'+inttoStr((DataSet as  TClientDataSet).recordCount))      ;
  end;
end;

procedure TSelectItem1_frm.dgh1TitleClick(Column: TColumnEh);
begin
   Label1.Caption:=Column.Title.Caption;
   Label1.Left:=35;
   Edit1.Left:=Label1.Left+ Label1.Width+3;
   bt1.Left:= Edit1.Left+ Edit1.Width+3;
   CheckBox2.Left:=bt1.Left+bt1.Width+5;
   if UpperCase(Column.Field.FieldName)<>UpperCase(FilterFieldName) then
   begin
     Edit1.Text:='';
     FilterFieldName:= Column.Field.FieldName;
   end;
//   Label1.Caption:=Column.Field.DisplayLabel;
//   Label1.Left:=5;
//   Edit1.Left:=10+ Label1.Width;
//   bt1.Left:= Edit1.Left+ Edit1.Width+5;
//   CheckBox2.Left:=bt1.Left+bt1.Width+10;
//   if UpperCase(Column.Field.FieldName)<>UpperCase(FilterFieldName) then
//   begin
//     Edit1.Text:='';
//     FilterFieldName:= Column.Field.FieldName;
//   end;
end;

procedure TSelectItem1_frm.SpeedButton1Click(Sender: TObject);
var
  BM:Pointer;
begin
  with  ds1.DataSet  do
  try
    Screen.Cursor := crHourGlass;
    BM:=GetBookmark;
    Close;
    Open;
    GotoBookmark(BM);
  finally
    FreeBookmark(bm ); //释放书签。
    Screen.Cursor := crDefault;
  end;
end;

procedure TSelectItem1_frm.FormResize(Sender: TObject);
begin
  Height:=Round( Width*0.628  ) +30  ;
end;

procedure TSelectItem1_frm.dgh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
 { with  (Sender as TDBGridEh)do
  begin
    if DataSource.DataSet.RecNo mod 2 = 1 then
    Background := $00FFC4C4;
//
//    if ((State=[gdSelected]))then
//      Canvas.Brush.Color:=clInactiveCaption;           //设置表格选定区域的颜色
//
////    DefaultDrawColumnCell(Rect,datacol,Column,state);
  end;   }
end;

procedure TSelectItem1_frm.dgh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
//  with  (Sender as TDBGridEh)do
//  begin
//    if ((State=[gdSelected]))then   //   or (State=[gdSelected,gdFocused] )
//      Canvas.Brush.Color:=clInactiveCaption;           //设置表格选定区域的颜色
//    DefaultDrawColumnCell(Rect,datacol,Column,State);
//  end;
end;

end.

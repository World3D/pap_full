--;���Ͳ���ʱ�Ի�

function x211052_OnDefaultEvent( sceneId, selfId,targetId )
	local PosX,PosZ=LuaFnGetWorldPos(sceneId, targetId)
	if  (PosX-70)*(PosX-70)+(PosZ-41)*(PosZ-41)<=2 then
		str="������ͳ����ɣ�"
	elseif(PosX-76)*(PosX-76)+(PosZ-52)*(PosZ-52)<=2 then
		str="��һ��˵��"
	elseif	(PosX-80)*(PosX-80)+(PosZ-64)*(PosZ-64)<=2 then
		str="�ڶ���˵��"
	elseif	(PosX-81)*(PosX-81)+(PosZ-80)*(PosZ-80)<=2 then
		str="������˵��"
	elseif	(PosX-88)*(PosX-88)+(PosZ-110)*(PosZ-110)<=2 then
		str="���㣬��ô���һ�����"	
	elseif	(PosX-113)*(PosX-113)+(PosZ-134)*(PosZ-134)<=2 then
		str="�������ҵ��ˣ��������ء�лл�㡣�ò�������������ҳû�������ᣬһ��ͻ�ȥ���ٺ١�"	
	end
	BeginEvent(sceneId)
		AddText(sceneId,str)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end



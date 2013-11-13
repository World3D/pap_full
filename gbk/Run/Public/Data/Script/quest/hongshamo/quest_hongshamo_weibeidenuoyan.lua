--Υ����ŵ��

--MisDescBegin
x205012_g_ScriptId = 205012
x205012_g_MissionIdPre =51
x205012_g_MissionId = 52
x205012_g_MissionKind = 11
x205012_g_MissionLevel = 55
--x205012_g_ScriptIdNext = {ScriptId = 205002 ,LV = 1 }
x205012_g_Name	="������" 
x205012_g_Name2	="�ٲ�̨" 
--x205012_g_DemandItem ={{id=13010003,num=1}}
--x205012_g_noDemandKill ={{id=301,num=1}}	

x205012_g_MissionName="Υ����ŵ��"
x205012_g_MissionInfo="    ����������ɫ���粻�������������Ĩ�׹�ȴ���˸е�������\n \n    ��������������䵽�����������ģ��һ�����ģ�۹�����Ҫ���������˰�æ�������ǵ۹��������ϣ���û���κε����ģ����Ȼ�Ҷ���˵�ѣ�\n \n    ��ո�ɱ���ҵ����������Ǵ�Ҷ������ġ��ٺ٣��㲻Ҫ�Ʊ��ˣ��ҵ�����ֻ�����ǻ�װ�ɵ����ڴ����������ȻΪ��һ������ɱ�����ǣ�\n \n    �Ҳ���Ź���ģ�������Щ����������ߣ������������ˣ��ҿ����Ǿ��Ǽ�ϸ����Ҫ��������Ⱥ��ϸ�����޻أ�һ����ʣ��ɱ�ˡ�"  --��������
x205012_g_MissionTarget="    ������Υ��������ŵ�ԣ������������Ǽ�ϸ��һ��Ҫ�����������Ϣ�������#G�ٲ�̨#W�������������з�����"		
x205012_g_MissionComplete="    ��Щ������ģ������ɿ��ģ�������ϵ��ˡ�"					--�������npc˵���Ļ�
--x205012_g_ContinueInfo="    ���ܸ��������ۣ�ҲҪ���Ǽ��������û�����"
--������
x205012_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x205012_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x205012_g_RadioItemBonus={}

--MisDescEnd
x205012_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x205012_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x205012_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x205012_g_MissionId) > 0 then
		
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x205012_g_MissionName)
		     AddText(sceneId,x205012_g_MissionComplete)
		     AddMoneyBonus(sceneId, x205012_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x205012_g_ScriptId, x205012_g_MissionId)
                

        elseif x205012_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x205012_g_MissionName)
                AddText(sceneId,x205012_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x205012_g_MissionTarget) 
		AddMoneyBonus(sceneId, x205012_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x205012_g_ScriptId, x205012_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x205012_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x205012_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x205012_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x205012_g_ScriptId, x205012_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x205012_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x205012_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x205012_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==5) then
	        if IsMissionHaveDone(sceneId, selfId, x205012_g_MissionIdPre) > 0 then
	        	if (GetName(sceneId,targetId)==x205012_g_Name) then
	        	        if IsHaveMission(sceneId,selfId, x205012_g_MissionId)<= 0 then
	        	            	return 1
	        	        end
	        	end
			if (GetName(sceneId,targetId)==x205012_g_Name2) then
				    if IsHaveMission(sceneId,selfId, x205012_g_MissionId) > 0 then
				    	return 1
	        	            end
	        	end
	        end 
	end     	
        return 0
	
end

--**********************************

--����

--**********************************

function x205012_OnAccept(sceneId, selfId)

	                                                  
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x205012_g_MissionId, x205012_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x205012_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
	LuaFnCreateMonster(sceneId, 306,135,174,0,1,-1)
	LuaFnCreateMonster(sceneId, 306,136,176,0,1,-1)
	LuaFnCreateMonster(sceneId, 306,140,174,0,1,-1)
	LuaFnCreateMonster(sceneId, 306,139,176,0,1,-1)
	         	                                    
	     
end



--**********************************

--����

--**********************************

function x205012_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x205012_g_MissionId)
	for i, item in pairs(x205012_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x205012_CheckSubmit( sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x205012_g_Name2) then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x205012_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x205012_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x205012_g_MissionId)
		AddExp(sceneId, selfId, x205012_g_ExpBonus)
		AddMoney(sceneId, selfId, x205012_g_MoneyBonus)
		for i, item in pairs(x205012_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x205012_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x205012_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x205012_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x205012_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x205012_OnItemChanged(sceneId, selfId, itemdataId)

end


--�ޱߵĵȴ�

--MisDescBegin
x206011_g_ScriptId = 206011
x206011_g_MissionIdPre =37
x206011_g_MissionId = 38
x206011_g_MissionKind = 8
x206011_g_MissionLevel = 40
x206011_g_ScriptIdNext = {ScriptId = 206012 ,LV = 1 }
x206011_g_Name	="����̨" 
x206011_g_Name2	="�����"
x206011_g_DemandItem ={{id=13010049,num=1}}


x206011_g_MissionName="�ޱߵĵȴ�"
x206011_g_MissionInfo="    Ҫ������������ֻ��һ���취�������������ž�ӹ���Ѿ������Ǵ����ˣ��������������Ѿ���ֵ�ˣ�\n \n    ������ҪһЩ������֤����ӹ�ر����ƣ�������������콫�������ģ���ʶ�ģ�������ߵ��˵ġ��������ʣ����ǵ��سǽ���\n \n    �ԣ����سǽ����������ϵĶ���! ���ǰ�����Ľ��ʬ�嶼��������ڣ���ȥ�ѷ����ʵ�ʬ���ҳ�����������������û��ʲô��������Ķ����� �ҵ�֮����ȥ����Щִ�ŵ���ʿ�ǿ��������ǹ齵��"  --��������
x206011_g_MissionTarget="    ��#c0080C0�����˵Ľ�#W����#G�����#W��"		                                                                                               
x206011_g_MissionComplete="    �⣬���ǡ������������ı�����\n \n    �ߣ����ܷ�����ʲô�£�����ʲô���⣬�˱��Ĺ���û������֮ǰ��ֻҪ���ǻ�����վ�ţ���һ�����������\n \n    ��λ��ʿ�����ܳ����ҵļ������Ӣ���˵ã�����������գ������Ѿ��Ի���ֻ��ϧ���Ǹ�Ϊ������ "					--�������npc˵���Ļ�
x206011_g_ContinueInfo="    �Ҷ�˵�ˣ���������������"
--������
x206011_g_MoneyBonus = 10000

--�̶���Ʒ���������8��
x206011_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x206011_g_RadioItemBonus={}

--MisDescEnd
x206011_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x206011_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x206011_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x206011_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x206011_g_Name2) then
			if x206011_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                	        BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x206011_g_MissionName)
				AddText(sceneId,x206011_g_ContinueInfo)
			        AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x206011_g_MissionTarget) 
				AddText(sceneId,format("\n    �����˵Ľ�   %d/%d", LuaFnGetItemCount(sceneId,selfId,x206011_g_DemandItem[1].id),x206011_g_DemandItem[1].num ))
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
			end
                	
			     
                	if x206011_CheckSubmit(sceneId, selfId, targetId) > 0 then
                	     BeginEvent(sceneId)
                	     AddText(sceneId,"#Y"..x206011_g_MissionName)
			     AddText(sceneId,x206011_g_MissionComplete)
			     AddMoneyBonus(sceneId, x206011_g_MoneyBonus)
                	     EndEvent()
			     DispatchMissionContinueInfo(sceneId, selfId, targetId, x206011_g_ScriptId, x206011_g_MissionId)
                	end
                end
                
        elseif x206011_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x206011_g_MissionName)
                AddText(sceneId,x206011_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x206011_g_MissionTarget) 
		AddMoneyBonus(sceneId, x206011_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x206011_g_ScriptId, x206011_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x206011_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x206011_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x206011_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x206011_g_ScriptId, x206011_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x206011_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x206011_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x206011_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==6) then
		if IsMissionHaveDone(sceneId, selfId, x206011_g_MissionIdPre) > 0 then
        		if (GetName(sceneId,targetId)==x206011_g_Name) then
        	        	if IsHaveMission(sceneId,selfId, x206011_g_MissionId) <= 0 then
        	            		return 1
        	            	end
        	        end
        		if (GetName(sceneId,targetId)==x206011_g_Name2) then
        	        	if IsHaveMission(sceneId,selfId, x206011_g_MissionId) > 0 then
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

function x206011_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x206011_g_MissionId, x206011_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x206011_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x206011_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x206011_g_MissionId)
	for i, item in x206011_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x206011_CheckSubmit( sceneId, selfId, targetId)
	if LuaFnGetItemCount(sceneId,selfId,x206011_g_DemandItem[1].id) == x206011_g_DemandItem[1].num then
		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x206011_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x206011_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x206011_g_MissionId)
		AddExp(sceneId, selfId, x206011_g_ExpBonus)
		AddMoney(sceneId, selfId, x206011_g_MoneyBonus)
		for i, item in x206011_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x206011_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x206011_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x206011_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x206011_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x206011_OnItemChanged(sceneId, selfId, itemdataId)

end

